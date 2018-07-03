require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
    return nil unless play.length > 0

    Play.new(play.first)
  end

  def self.find_by_playwright(name)
    playwright_id = Playwright.find_by_name(name)
    raise "#{name} is not in database" unless playwright.length > 0

    plays = PlayDBConnection.instance.execute(<<-SQL, playwright_id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
  end

  class Playwright
    attr_accessor :name

    def initialize(options)
      @id = options['id']
      @name = name['name']
    end

    def self.all
      PlayDBConnection.instance.execute(<<-SQL)
        SELECT
          *
        FROM
          playwrights
      SQL
    end

    def self.find_by_name(name)
      playwright_id = PlayDBConnection.instance.execute(<<-SQL, name)
        SELECT
          id
        FROM
          playwrights
        WHERE
          name = ?
      SQL

      raise 'Playwright does not exist' unless playwright_id.length > 0

      playwright_id.first
    end

    def create
      raise "#{self} already in database" if @id

      PlayDBConnection.instance.execute(<<-SQL, @name)
        INSERT INTO
          playwrights (name)
        VALUES
          (?)
      SQL

      @id = PlayDBConnection.instance.last_insert_row_id
    end

    def update
      raise "#{self} not in database" unless @id

      PlayDBConnection.instance.execute(<<-SQL, @name, @id)
        UPDATE
          playwrights
        SET
          name = ?
        WHERE
          id = ?
      SQL
    end

    def get_plays
      Play.find_by_playwright(@name)
    end
  end
end
