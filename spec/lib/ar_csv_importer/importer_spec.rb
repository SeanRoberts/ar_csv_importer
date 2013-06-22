require_relative '../../../lib/ar_csv_importer/importer.rb'

class Merchant
end

describe ARCSVImporter::Importer do
  subject { ARCSVImporter::Importer.new('/path/to/file', Merchant, :title, :address) }
  its(:file_path) { should == "/path/to/file" }
  its(:import_class) { should == Merchant }
  its(:row_order) { should == [:title, :address] }

  context "#attrs_from_row" do
    it "should parse" do
      row = ["Merchant Title", "Merchant Address"]
      attrs = {:title => "Merchant Title", :address => "Merchant Address"}
      subject.send(:attrs_from_row, row).should == attrs
    end
  end
end