require 'tk'
require 'tkextlib/tile'
require_relative 'extract_attachments'


def browse_file(entry)
  filepath = Tk.getOpenFile
  entry.value = filepath unless filepath.empty?
end

def browse_folder(entry)
  folderpath = Tk.chooseDirectory
  entry.value = folderpath unless folderpath.empty?
end

root = TkRoot.new { title "MBOX Attachment Extractor" }

TkLabel.new(root) do
  text 'Input MBOX file:'
  grid(row: 0, column: 0, padx: 15, pady: 15)
end

input_file = TkEntry.new(root) do
  grid(row: 0, column: 1, padx: 15, pady: 15)
end

TkButton.new(root) do
  text 'Browse'
  command { browse_file(input_file) }
  grid(row: 0, column: 2, padx: 15, pady: 15)
end

TkLabel.new(root) do
  text 'Output folder:'
  grid(row: 1, column: 0, padx: 15, pady: 15)
end

output_folder = TkEntry.new(root) do
  grid(row: 1, column: 1, padx: 15, pady: 15)
end

TkButton.new(root) do
  text 'Browse'
  command { browse_folder(output_folder) }
  grid(row: 1, column: 2, padx: 15, pady: 15)
end

progress = Tk::Tile::Progressbar.new(root) do
  mode 'indeterminate'
  maximum 100
  value 0
  grid(row: 3, column: 1, padx: 15, pady: 15)
end

TkButton.new(root) do
  text 'Extract Attachments'
  command do
    mbox_file = input_file.get
    output_dir = output_folder.get

    unless mbox_file.empty? || output_dir.empty?
      progress.start
      begin
        ExtractAttachments.extract_attachments(mbox_file, output_dir)
        Tk.messageBox('type' => 'ok', 'icon' => 'info', 'title' => 'Success', 'message' => 'Attachments extracted successfully.')
      ensure
        progress.stop
      end
    else
      Tk.messageBox('type' => 'ok', 'icon' => 'error', 'title' => 'Error', 'message' => 'Please provide both input file and output folder.')
    end
  end
  grid(row: 2, column: 1, padx: 15, pady: 15)
end

Tk.mainloop
