na_controls = input('overlay_controls')
  # puts "Here is the input value:"
  # puts na_controls

include_controls "microsoft-sql-server-2017-cis-baseline" do

  # All caveats go in a loop
  na_controls.each do |overlay_control|
    control overlay_control do
      impact 0.0
      describe "Skipped in #{ENV["BASELINE"]} Overlay" do
        skip "The control is not applicable to the system categorization of #{ENV["BASELINE"]}" # This is caveat
      end
    end
  end
  
  # All describe block/other modifications go under separate controls and under the appropriate baseline
  case ENV["BASELINE"]
  when "High"
    control "microsoft-sql-server-2017-cis-8.1" do
      title "Title modified in #{ENV["BASELINE"]} Overlay"
      impact 0.5

      describe os.unix? do
        it { should cmp true }
      end
    end
  when "Moderate"
    control "microsoft-sql-server-2017-cis-8.1" do
      title "Title modified in #{ENV["BASELINE"]} Overlay"
      impact 0.5

      describe os.linux? do
        it { should cmp true }
      end
    end
  when "Low"
    control "microsoft-sql-server-2017-cis-8.1" do
      title "Title modified in #{ENV["BASELINE"]} Overlay"
      impact 0.5

      describe os.windows? do
        it { should cmp true }
      end
    end
  else
    puts "Please set the environment variable to your security categorization"
  end
  
end