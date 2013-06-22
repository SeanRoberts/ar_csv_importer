require 'ar_csv_importer/importer.rb'

module ARCSVImporter
  def has_csv_importer(*row_order)
    class_eval do
      cattr_accessor :csv_importer_row_order
      self.csv_importer_row_order = row_order

      def self.csv_import(file_path)
        importer.import
      end

      def self.csv_import!(file_path)
        importer.import(true)
      end

      def self.importer
        @importer ||= ARCSVImporter::Importer.new(file_path, self, self.csv_importer_row_order)
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ARCSVImporter)