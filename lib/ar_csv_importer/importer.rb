module ARCSVImporter
  class Importer
    attr_accessor :file_path, :import_class, :row_order

    def initialize(file_path, import_class, *row_order)
      @file_path = file_path
      @import_class = import_class
      @row_order = row_order.flatten
    end

    def import(raise_validation_errors = false)
      meth = raise_validation_errors ? :create! : :create
      CSV.foreach(file_path) do |row|
        import_class.send(meth, attrs_from_row(row))
      end
    end

    private
      def attrs_from_row(row)
        Hash[row.each_with_index.map { |r, i| [row_order[i], r] }]
      end
  end
end