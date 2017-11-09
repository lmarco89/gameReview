RSpec.describe GetGameJob, vcr: true, type: :job do

  before(:each) do
    GetGameJob.perform_now(20)
    @game = Game.where(id: 20)

    GetGameJob.perform_now(9608)
    @m_a_b_2 = Game.where(id: 9608)

    GetGameJob.perform_now(358)
    @mario = Game.where(id: 358)
  end

  it 'gets a game' do
    expect(@game.length).to eq 1
  end

  it 'gets the game name' do
    expect(@game.first.name).to eq 'BioShock'
  end

  it 'gets the game slug' do
    expect(@game.first.slug).to eq "bioshock"
  end

  it 'gets the game summary' do
    expect(@game.first.summary).to_not eq nil
  end

  it 'gets the game franchise' do
    expect(@mario.first.franchise).to eq 24
  end

  it 'gets the game collection' do
    expect(@mario.first.collection).to eq 240
  end

  it 'gets the game popularity' do
    expect(@game.first.popularity).to eq 9
  end

  it 'gets the game category' do
    expect(@game.first.category).to eq 0
  end

  it 'gets the game status' do
    expect(@m_a_b_2.first.status).to eq 2
  end

  it 'gets the game cover' do
    expect(@game.first.cover_url).to eq "//images.igdb.com/igdb/image/upload/t_thumb/ajwsi2l7piuzmfvwxsbj.jpg"
  end

  it 'gets the initial release date' do
    expect(@game.first.release_date_human).to eq '2008-Dec-25'
  end

  it 'adds the game engines' do
    expect(@game.first.game_engines.first.name).to eq "Unreal Engine"
  end

  it 'gets the game modes' do
    expect(@game.first.game_modes.first.id).to eq 1
  end

  it 'gets the genres' do
    expect(@game.first.genres.first.id).to eq 5
  end

  it 'gets the keywords' do
    expect(@game.first.keywords.first.id).to eq 138
  end

  it 'gets the themes' do
    expect(@game.first.themes.first.id).to eq 1
  end

  it 'gets the platforms' do
    expect(@game.first.platforms.first.id).to eq 6
    expect(@game.first.platforms.length).to eq 8
  end

  # TODO Test image and video

end
