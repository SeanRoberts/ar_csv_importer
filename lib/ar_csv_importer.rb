require 'ar_csv_importer/importer.rb'

module ARCSVImporter
  def has_csv_importer(*row_order)
    class_eval do
      cattr_accessor :csv_importer_row_order
      self.csv_importer_row_order = row_order

      def self.csv_import(file_path)
        importer(file_path).import
      end

      def self.csv_import!(file_path)
        importer(file_path).import(true)
      end

      def self.importer(file_path)
        @importer ||= ARCSVImporter::Importer.new(file_path, self, self.csv_importer_row_order)
      end
    end
  end
end

ActiveRecord::Base.send(:extend, ARCSVImporter)