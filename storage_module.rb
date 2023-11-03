module Storage
  def read_file(name)
    return JSON.parse(File.read("#{name}.json")) if File.exist?("#{name}.json")

    []
  end

  def write_file(name, array)
    data = []
    array.each do |item|
      data.append(item.generate_string)
    end
    File.write("#{name}.json", JSON.generate(data))
  end
end
