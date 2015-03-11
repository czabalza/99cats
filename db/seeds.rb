Cat.create!(name: 'Markov', birth_date: '1995/5/1', color: 'gray', sex: 'M',
            description: "The smartest cat I ever had!")
Cat.create!(name: 'Gizmo', birth_date: '2000/6/12', color: 'black', sex: 'M',
            description: "The dumbest cat I ever had!")
Cat.create!(name: 'Breakfast', birth_date: '1983/5/6', color: 'brown', sex: 'F',
            description: "The oldest cat I ever had!")

CatRentalRequest.create!(cat_id: 1, start_date: '2015/3/10', end_date: '2015/3/14',
                         status: 'APPROVED')
CatRentalRequest.create!(cat_id: 1, start_date: '2015/3/10', end_date: '2015/3/14',
                        status: 'APPROVED')
CatRentalRequest.create!(cat_id: 1, start_date: '2015/3/11', end_date: '2015/3/12',
                        status: 'APPROVED')
