class ExampleJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    sleep 1
    puts 'Działamy!'
    sleep 1
    puts 'Pracujemy...'
    sleep 1
    puts 'Wysylamy dane do NSA!'
  end
end
