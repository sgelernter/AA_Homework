# == Schema Information
#
# Table name: actors
#
#  id          :integer      not null, primary key
#  name        :string
#
# Table name: movies
#
#  id          :integer      not null, primary key
#  title       :string
#  yr          :integer
#  score       :float
#  votes       :integer
#  director_id :integer
#
# Table name: castings
#  id          :integer      not null, primary key
#  movie_id    :integer      not null
#  actor_id    :integer      not null
#  ord         :integer


def find_angelina
  #find Angelina Jolie by name in the actors table
  Actor.find_by(name: "Angelina Jolie")
end

def top_titles
  # get movie titles from movies with scores greater than or equal to 9
  # hint: use 'select' and 'where'
  Movie.select(:id, :title).where("score >= ?", 9)

end

def star_wars
  #display the id, title and year of each Star Wars movie in movies.
  # hint: use 'select' and 'where'
  Movie.select(:id, :title, :yr).where("title LIKE ?", "%Star Wars%")

end


def below_average_years
  #display each year with movies scoring under 5,
  #with the count of movies scoring under 5 aliased as bad_movies,
  #in descending order
  # hint: use 'select', 'where', 'group', 'order'
  # Movie.find_by_sql(<<-SQL)
  #   SELECT
  #     yr, COUNT(title) as bad_movies
  #   FROM 
  #     movies
  #   WHERE
  #     score < 5
  #   GROUP BY
  #     yr
  #   ORDER BY
  #     COUNT(title) DESC
  # SQL
  Movie
    .select(:yr, 'COUNT(title) as bad_movies')
    .where("score < ?", 5)
    .group(:yr)
    .order('COUNT(title) DESC')

end

def alphabetized_actors
  # display the first 10 actor names ordered from A-Z
  # hint: use 'order' and 'limit'
  # Note: Ubuntu users may find that special characters
  # are alphabetized differently than the specs.
  # This spec might fail for Ubuntu users. It's ok!
  Actor
    .order('name ASC')
    .limit(10)

end

def pulp_fiction_actors
  # practice using joins
  # display the id and name of all actors in the movie Pulp Fiction
  # hint: use 'select', 'joins', 'where'
  pulp_id = Movie.find_by(title: 'Pulp Fiction')

    Actor 
    .select(:id, :name)
    .joins(:movies)
    .where('movie_id = ?', pulp_id)

  #ALTERNATE SOLUTION--WHY DO I NEED "GROUP" FOR THIS TO WORK?
  # Actor 
  #   .select(:id, :name)
  #   .joins(:movies)
  #   .joins(:castings)
  #   .where('title = ?', 'Pulp Fiction')
  #   .group(:id, :name)

end

def uma_movies
  #practice using joins
  # display the id, title, and year of movies Uma Thurman has acted in
  # order them by ascending year
  # hint: use 'select', 'joins', 'where', and 'order'

  uma_id = Actor.find_by(name: "Uma Thurman")

  Movie
    .select(:id, :title, :yr)
    .joins(:castings)
    .where('actor_id = ?', uma_id)
    .order('yr ASC')

    #ALTERNATE SOLUTION--WHY DO I NEED THE 'GROUP' FOR THIS TO WORK?
    # Movie
    # .select(:id, :title, :yr)
    # .joins(:castings)
    # .joins(:actors)
    # .where('name = ?', 'Uma Thurman')
    # .order('yr ASC')
    # .group(:id, :title, :yr)

end
