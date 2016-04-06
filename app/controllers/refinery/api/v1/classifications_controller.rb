module Refinery
  module Api
    module V1
      class ClassificationsController < Refinery::Api::BaseController
        def update
          authorize! :update, Product
          authorize! :update, Taxon
          classification = Refinery::Classification.find_by(
            product_id: params[:product_id],
            taxon_id: params[:taxon_id]
          )
          # Because position we get back is 0-indexed.
          # acts_as_list is 1-indexed.
          classification.insert_at(params[:position].to_i + 1)
          render nothing: true
        end
      end
    end
  end
end