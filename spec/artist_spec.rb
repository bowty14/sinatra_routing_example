require('spec_helper')

describe '#Artist' do

  describe('.all') do
    it('returns am empty array when there are no artists') do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an artist') do
      artist = Artist.new({:name => "Eminem", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Lady Gaga", :id => nil})
      artist2.save()
      expect(Artist.all).to(eq([artist, artist2]))
    end
  end
  

  describe('.clear') do
    it("clears all artists") do
      artist = Artist.new({:name => "Eminem", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Lady Gaga", :id => nil})
      artist2.save()    
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end
  
  describe('.find') do
    it("finds an artist by id") do
      artist = Artist.new({:name => "Eminem", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Lady Gaga", :id => nil})
      artist.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe('#==') do 
    it("is the same artist if it has the same attributes as another artist") do 
      artist = Artist.new({:name => "Eminem", :id => nil})
      artist2 = Artist.new({:name => "Eminem", :id => nil})
      expect(artist).to(eq(artist2))
    end
  end

  describe('#update') do
    it("adds an album to an artist") do
       artist = Artist.new({:name => "Eminem", :id => nil})
       artist.save()
       album = Album.new({:name => "Kamikaze", :id => nil})
       album.save()
       artist.update({:album_name => "Kamikaze"})
       expect(artist.albums).to(eq([album]))
    end
  end

  describe('#delete') do
    it("deletes an artist by id") do
      artist = Artist.new({:name => "Eminem", :id => nil})
      artist.save()
      artist2 = Artist.new({:name => "Lady Gaga", :id => nil})
      artist2.save()
      artist2.delete()
      expect(Artist.all).to(eq([artist]))
    end
  end
end