require 'mail'
require 'fileutils'

module ExtractAttachments
  def self.extract_attachments(mbox_file, output_dir)
    mbox_data = File.read(mbox_file)
    mails = mbox_data.split(/^From .*$/).reject(&:empty?)

    mails.each do |mail_raw|
      mail = Mail.read_from_string(mail_raw)

      mail.attachments.each do |attachment|
        # Create the output directory if it doesn't exist
        FileUtils.mkdir_p(output_dir)

        # Save attachment to output_dir
        File.open(File.join(output_dir, attachment.filename), 'wb') do |file|
          file.write(attachment.body.decoded)
        end
      end
    end
  end
end
