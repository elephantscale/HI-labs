import happybase

connection = happybase.Connection('localhost')
table = connection.table('users')

#put
table.put('user1', {'info:email': 'me@gmail.com',
                      'info:phone': '555-1234'})
table.put('user2', {'info:email': 'me2@gmail.com',
                      'info:phone': '666-1234'})

# get
row = table.row('user1')
print row['info:email']

# scan
for key, data in table.scan():
    print key, data