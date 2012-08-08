require 'spec_helper'

describe Object do
  describe "tryit method" do
    let(:obj) { Object.new }

    it "should raise exception" do
      class A; def foo; raise "test exception" end end
      expect do 
        A.new.tryit{ foo }
      end.to raise_error(RuntimeError, "test exception")
    end

    it "should not raise NoMethodError" do
      expect{ obj.tryit{ foo } }.to_not raise_error(NoMethodError)
    end

    it "should yield the block" do
      obj.should_receive(:foo)
      obj.tryit{ foo }
    end

    it "should send a method" do
      obj.should_receive(:foo)
      obj.tryit{ foo }
    end

    it "should send a method with arguments" do
      def obj.foo(arg); arg end
      obj.tryit(:foo, "arguments").should == "arguments"
    end

    it "test" do
      def obj.foo(arg); arg end
      expect{ obj.tryit{ foo("foo")} }.to_not raise_error
      obj.tryit{ foo("foo") }.should == "foo"
    end

    it "should check chain calls" do
      def obj.foo; self end
      def obj.boo; "boo" end
      obj.tryit{ foo.boo }.should == 'boo'
    end

    it "should not raise exception in chain calls" do
      def obj.foo; self end
      def obj.koo; self end
      expect{ obj.tryit{ foo.koo.too }}.to_not raise_error(NameError)
    end

    it "should set local variable" do
      pending "the question is it possible to set local variable ?"
      result = ""
      def obj.foo; result = "test" end
      result.should == "test"
    end

    it "should catch ZeroDivisionError exception" do
      expect do
        obj.tryit { 1/0 }
      end.to raise_error(ZeroDivisionError)
      
      TryIt.exceptions << ZeroDivisionError
      
      expect do
        obj.tryit { 1/0 }
      end.to_not raise_error(ZeroDivisionError)
    end

    it "should use another handler" do
      TryIt.handler = lambda { |e| puts e }
      TryIt.exceptions << TypeError
      $stdout.should_receive(:puts)
      obj.tryit { raise TypeError }
    end
  end
end
