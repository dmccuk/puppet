Facter.add("environment_type") do
  setcode do
    Facter.value(:hostname)[1..1]
  end
end

