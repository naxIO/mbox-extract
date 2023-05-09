# frozen_string_literal: true

require 'mail'
require 'fileutils'

def self.sanitize_filename(filename)
  filename.gsub(%r{[/\\]}, '_')
end

module ExtractAttachments
  def self.extract_attachments(mbox_file, output_dir)
    mbox = Mbox.open(mbox_file)
    mbox.each do |message|
      attachments = message.attachments
      attachments.each do |attachment|
        sanitized_filename = sanitize_filename(attachment.filename)
        output_path = File.join(output_dir, sanitized_filename)
        File.open(output_path, 'wb') { |file| file.write(attachment.decoded) }
      rescue Errno::ENOENT => e
        puts "Error: #{e.message} - Skipping file: #{attachment.filename}"
      rescue StandardError => e
        puts "Error: #{e.message} - Skipping file: #{attachment.filename}"
      end
    end
  end
end
