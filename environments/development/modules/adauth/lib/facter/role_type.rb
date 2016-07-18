Facter.add("role_type") do
  setcode do
    Facter.value(:hostname)[6..7]
  end
end

