require 'nokogiri'

module Fastlane
  module Actions
    module SharedValues
      TOTAL_ERRORS = :TOTAL_ERRORS
      TOTAL_WARNINGS = :TOTAL_WARNINGS
      TOTAL_VIOLATIONS = :TOTAL_VIOLATIONS
    end

    class LintreportAction < Action
      def self.run(params)
        puts "Generating Lint report"...
        filename = params[:filename]

        doc = Nokogiri::HTML(open(filename))
        totalViolationsValue = doc.css('table')[1].css("tbody").css("tr")[0].css("td")[1].text

        totalWarningsValue = doc.css('table')[1].css("tbody").css("tr")[1].css("td")[1].text

        totalErrorsValue = doc.css('table')[1].css("tbody").css("tr")[2].css("td")[1].text

        Actions.lane_context[SharedValues::TOTAL_ERRORS] = totalErrorsValue.to_s
        Actions.lane_context[SharedValues::TOTAL_WARNINGS] = totalWarningsValue.to_s
        Actions.lane_context[SharedValues::TOTAL_VIOLATIONS] = totalViolationsValue.to_s

      end

      def self.description
        "It gets the total_coverage from HTML report generated by swiftlint"
      end

      def self.details
        # Optional:
        # this is your chance to provide a more detailed description of this action
        "You can only use this action with slather and passing 'html: true' as parameter"
      end

      def self.available_options
        # Define all options your action supports.

        # Below a few examples
        [
          FastlaneCore::ConfigItem.new(key: :filename,
                                       env_name: "FL_LINTREPORT_FILENAME",
                                       description: "Create a development certificate instead of a distribution one",
                                       is_string: false, # true: verifies the input is a string, false: every kind of value
                                       default_value: "") # the default value if the user didn't provide one
        ]
      end

      def self.is_supported?(platform)
        platform == :ios
      end

    end
  end
end
