include_controls "microsoft-sql-server-2017-cis-baseline" do
  na_controls = input('overlay_controls')
  # puts "Here is the input value:"
  # puts na_controls

  na_controls.each do |overlay_control|
    control overlay_control do
      impact 0.0
      describe "Skipped in #{ENV["BASELINE"]} Overlay" do
        skip "The control is not applicable to the system categorization of #{ENV["BASELINE"]}"
      end
    end
  end
  
  control "microsoft-sql-server-2017-cis-8.1" do
    title "Title modified in #{ENV["BASELINE"]} Overlay"
    impact 0.5

    describe os.windows? do
      it { should cmp true }
    end
  end
end