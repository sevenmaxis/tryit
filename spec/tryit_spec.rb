require 'spec_helper'

describe Object do
  describe "try method" do
    let(:obj) { Object.new }

    it "should raise exception" do
      class A; def foo; raise "test exception" end end
      expect do 
        A.new.try{ foo }
      end.to raise_error(RuntimeError, "test exception")
    end

    it "should not raise NameError" do
      expect{ obj.try{ foo } }.to_not raise_error(NameError)
    end

    it "should yield the block" do
      obj.should_receive(:foo)
      obj.try{ foo }
    end

    it "should send a method" do
      obj.should_receive(:foo)
      obj.try{ foo }
    end

    it "should send a method with arguments" do
      def obj.foo(arg); arg end
      obj.try(:foo, "arguments").should == "arguments"
    end

    it "test" do
      def obj.foo(arg); arg end
      expect{ obj.try{ foo("foo")} }.to_not raise_error
      obj.try{ foo("foo") }.should == "foo"
    end

    it "should check chain calls" do
      def obj.foo; self end
      def obj.boo; "boo" end
      obj.try{ foo.boo }.should == 'boo'
    end

    it "should not raise exception in chain calls" do
      def obj.foo; self end
      def obj.koo; self end
      expect{ obj.try{ foo.koo.too }}.to_not raise_error(NameError)
    end

    it "should set local variable" do
      pending "the question is it possible to set local variable ?"
      result = ""
      def obj.foo; result = "test" end
      result.should == "test"
    end
  end
end
