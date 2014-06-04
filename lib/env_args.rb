module EnvArgs
  def self.to(default = nil)
    __fetch__('TO', required: true) { default }
  end

  def self.date(default = Date.today)
    __fetch__('DATE') { default }.to_date
  end

  def self.method_missing(name, required: false, &block)
    __fetch__(name.to_s.upcase, required: required, &block)
  end

  def self.__fetch__(name, required: false, &block)
    value = ENV.fetch(name) { block.call if block_given? }
    if required && value.nil?
      raise %{Missing required environment variable #{name}="..."}
    end
    value
  end
end
