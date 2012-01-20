class Admin::UsersController < Puffer::Base

  setup do
    group :users
  end

  index do
    # field :id
    field :email
    field :encrypted_password
    field :reset_password_token
    field :reset_password_sent_at
    field :remember_created_at
    field :sign_in_count
    field :current_sign_in_at
    field :last_sign_in_at
    field :current_sign_in_ip
    field :last_sign_in_ip
    # field :created_at
    # field :updated_at
    field :name
  end

  form do
    # field :id
    field :email
    field :encrypted_password
    field :reset_password_token
    field :reset_password_sent_at
    field :remember_created_at
    field :sign_in_count
    field :current_sign_in_at
    field :last_sign_in_at
    field :current_sign_in_ip
    field :last_sign_in_ip
    # field :created_at
    # field :updated_at
    field :name
  end

end
