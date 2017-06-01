Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1019046031402-9eqim7jdi7l987tpno9plpf2k3863i9f.apps.googleusercontent.com',  'LXc51iP775kP0P4eRsZwvaLS'
  provider :twitter, 'PBF78RACKbuMl06SBit7jV2Dl',  'NCmYLs8FhjF44jQF3KzQwupiYdW9jZEkdm8arjotCKXO5ugaKv'
  provider :github, 'fd3ce3c990841d6c33dd',  'c9146d18fcf3b727d58dff80d65232ec76ece746'
end
