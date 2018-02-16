contacts = []

  contacts << { name: "Thomas Jefferson", phone: "+1 206 310 1369" , email: "tjeff@us.gov" }
  contacts << { name: "Charles Darwin"  , phone: "+44 20 7123 4567", email: "darles@evolve.org" }
  contacts << { name: "Nikola Tesla"    , phone: "+385 43 987 3355", email: "nik@inductlabs.com" }
  contacts << { name: "Genghis Khan"    , phone: "+976 2 194 2222" , email: "contact@empire.com" }
  contacts << { name: "Malcom X"        , phone: "+1 310 155 8822" , email: "x@theroost.org" }


  def index(contacts)
    contacts.each_with_index do |contact, index|
      puts "#{index+1}) #{contact[:name]}"
    end
  end


  def show(contact)
    puts
    puts contact[:name].to_s
    puts "phone: #{contact[:phone]}"
    puts "email: #{contact[:email]}"
    puts
  end


  def ask(prompt)
    print prompt
    gets.chomp
  end


  def create_new
    contact = {}

    puts
    puts "Enter contact info:"

    contact[:name]  = ask("Name? ")
    contact[:phone] = ask("Phone? ")
    contact[:email] = ask("Email? ")

    contact  # returns contact object
  end


  def action_new(contacts)
   contact = create_new

   contacts << contact

   puts
   puts "New contact created:"
   puts

   show(contact)
   puts
  end


  def action_show(contacts, id)
    #id = response.to_i

    contact = contacts[id - 1]

    puts
    show(contact)
    puts
  end


  def action_delete(contacts)
    puts
    response = ask("Delete which contact? ")

    id = response.to_i

    puts
    puts "Contact for #{contacts[id - 1][:name]} deleted."

    contacts.delete_at(id - 1)

    puts
  end

# --------------------------------------------------

loop {
  index(contacts)

  puts
  response = ask("Who would you like to see (n for new, d for delete, q to quit)?")

  break if response == "q"

  if response == "n"
    action_new(contacts)
  elsif response == "d"
    action_delete(contacts)
  else
    action_show(contacts, response.to_i)
  end


}

puts
puts "Bye!"
