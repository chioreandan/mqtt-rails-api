# frozen_string_literal: true

user = User.create(email: 'chiorean.dan12@gmail.com', password: '123456', password_confirmation: '123456')

Product.create([
                {
                  name: "Codul lui DaVinci",
                  code: "9780552149518"
                },
                {
                  name: "Fortareata Digitala",
                  code: "9780552151696"
                },
                {
                  name: "Make Me by Lee Child",
                  code: "9780857502681"
                }
              ]
             )

Order.create([
              {
                user: user,
                start_date: Time.now,
                end_date: Time.now + 20.days
              },
              {
                user: user,
                start_date: Time.now,
                end_date: Time.now + 20.days
              },
              {
                user: user,
                start_date: Time.now,
                end_date: Time.now + 20.days
              },
            ])

Order.first.products << Product.first
Order.first.products << Product.last

Order.second.products << Product.second

Order.third.products << Product.first
Order.third.products << Product.second
Order.third.products << Product.last

Order.first.save!
Order.second.save!
Order.third.save!
