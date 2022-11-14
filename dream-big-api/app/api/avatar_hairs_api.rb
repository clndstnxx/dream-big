require 'grape'

class AvatarHairsApi < Grape::API
  desc 'Allow retrieval of a users avatar-hairs'
  get '/avatar-hairs/:id' do
    avatar_hairs_parameters = ActionController::Parameters.new(params)
      .permit(
        :id
      )

    # Auth

    result = AvatarHairs.find(params[:id])
    present result, with: Entities::AvatarHairsEntity
  end

  desc 'Allow creation of an Avatar Hairs'
  params do
  
    requires :imgpath, type: String, desc: 'Link to Accesory image for avatar-Hairs'

  end
  post '/avatar-hairs' do
    avatar_hairs_parameters = ActionController::Parameters.new(params)
      .permit(
        :imgpath
      )

    # Auth...

    result = AvatarHairs.create!(avatar_parameters)

    present result, with: Entities::AvatarHairsEntity
  end

  desc 'Allow updating of a Avatar Hairs'
  params do
    
    optional :imgpath, type: String, desc: 'Link to Accesory image for avatar-Hairs'

  end

  put '/avatar-hairs/:id' do
    avatar_hairs_parameters = ActionController::Parameters.new(params)
      .permit(
        :imgpath
      )

    # Auth

    result = AvatarHairs.find(params[:id])
    result.update! avatar_hairs_parameters

    present result, with: Entities::AvatarHairsEntity
  end

  desc 'Delete the Avatar Hairs with the indicated id'
  params do
    requires :id, type: Integer, desc: 'The id of the avatar-Hairs to delete'
  end
  delete '/avatar-hairs/:id' do
    AvatarHairs.find(params[:id]).destroy!
    true
  end

  get '/avatar-hairs' do
    result = AvatarHairs.all

    present result, with: Entities::AvatarHairsEntity
  end
end