require 'mobile_view/forced_switching'

module MobileView
  module ControllerAdditions
    extend ActiveSupport::Concern

    include MobileView::ForcedSwitching::ControllerAdditions

    included do |base|
      base.extend ClassMethods

      # make mobile? method a view helper too
      helper_method :mobile?
    end

    module ClassMethods
      # Install MobileView into a Controller.
      #
      # By invoking this method, a view-path resolver will be prepended
      # before all the existing resolvers, immediately. If you're going
      # to force mobile switching (see {ForcedSwitching}),
      # then you have to invoke them before +has_mobile_view+.
      #
      # == Example
      #
      # Present non-mobile version to iPad users:
      #
      #   class ApplicationController < ActionController::Base
      #     before_filter :force_non_mobile!, :if => :is_ipad?
      #
      #     has_mobile_view
      #   end
      #
      def has_mobile_view

        # find mobile view templates first, if mobile device is detected.
        self.before_filter do
          prepend_view_path(MobileView.resolver) if mobile?
        end
      end
    end

    protected
    # Returns <tt>true</tt> if +MobileView+ uses mobile version of view templates,
    # <tt>false</tt> otherwise.
    def mobile?
      forced_mobile? || request.headers["X_MOBILE_DEVICE"].present?
    end
  end
end
