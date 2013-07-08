# encoding: UTF-8

class Presenter
  attr_reader :resource

  def helpers
    ApplicationController.helpers
  end

  def initialize(resource)
    @resource = resource
  end

  def method_missing(meth, *args, &blk)
    meth = resource_method(meth)

    if resource.respond_to?(meth)
      resource.__send__ meth
    else
      super
    end
  rescue NoMethodError
    raise NoMethodError.new("undefined method '#{meth}' for #{resource}")
  end

  private

  def resource_method(meth)
    matched = meth.to_s.match(/^_(.+)$/)
    matched ? matched[1] : meth
  end
end

