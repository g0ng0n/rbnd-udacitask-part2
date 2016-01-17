module Printable

  def Pdf_generator(title,list)

    filename="#{title}.pdf"
    if File.file?(filename)
      puts "The file Already Exists Deleting it"
      FileUtils.rm(filename)
    end
    render_pdf(filename, list)

  end

  private
    def render_pdf(filename,list)
      pdf = Prawn::Document.new(:page_size => 'A4')

      data = [ %w[Type Description Date Priority]]

      add_data(data, list)

      pdf.table(data, :row_colors => ["F0F0F0",nil,"F0F0F0",nil]) do
        row(0).style({:align => :center})
        row(2).style({:align => :center})
        row(3).style({:inline_format => true})
      end

      pdf.render_file(filename)
    end

    def add_data(data, list)
      list.each do |item|
          begin
            details = item.details_array
            data.push(details)
          rescue Exception => e
            throw_error(e)
          end
      end
    end


end
