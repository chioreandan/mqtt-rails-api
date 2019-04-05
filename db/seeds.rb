# frozen_string_literal: true

user = User.create(email: 'chiorean.dan12@gmail.com', password: '123456', password_confirmation: '123456')

Sensor.create([
                {
                  user: user,
                  topic: 'Topic 1',
                  name: 'Sensor 1',
                  var_type: 'Integer',
                  room: 'DormRoom'
                },
                {
                  user: user,
                  topic: 'Topic 2',
                  name: 'Sensor 2',
                  var_type: 'Integer',
                  room: 'DormRoom'
                },
                {
                  user: user,
                  topic: 'Topic 3',
                  name: 'Sensor 3',
                  var_type: 'Integer',
                  room: 'DormRoom'
                }
              ]
             )
