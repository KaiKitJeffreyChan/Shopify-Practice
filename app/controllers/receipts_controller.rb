require_relative 'points_calculator'

class ReceiptsController < ApplicationController
  before_action :set_receipt, only: [:show, :update, :destroy, :points]

  # POST /receipts/process
  def create
    @receipt = Receipt.new(receipt_params)
    if @receipt.save
      render json: { id: @receipt.id.to_s }, status: :ok
    else
      render json: { error: "Please verify input.", details: @receipt.errors.full_messages }, status: :bad_request
    end
  end

  # GET /receipts/:id/points
  def points
    if @receipt = Receipt.find_by(id: params[:id])
      points = PointsCalculator.new(@receipt).calculate_points
      render json: { points: points }, status: :ok
    else
      render json: { error: "Receipt not found" }, status: :not_found
  end

  def set_receipt
    @receipt = Receipt.find_by(id: params[:id])
    render json: { error: "Receipt not found" }, status: :not_found unless @receipt
  end

  # Permit nested attributes for items.
  def receipt_params
    params.require(:receipt).permit(
      :retailer, :purchase_date, :purchase_time, :total,
      items_attributes: [:short_description, :price]
    )
  end
end
