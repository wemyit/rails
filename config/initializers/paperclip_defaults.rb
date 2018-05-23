url = '/system/:class/:attachment/:id_partition/:hash.:content_type_extension'

Paperclip::DataUriAdapter.register

Paperclip::Attachment
    .default_options
    .update(
        {
            path: ":rails_root/public#{url}",
            url: url,
            hash_secret: Rails.application.secrets.secret_key_base
        }
    )
