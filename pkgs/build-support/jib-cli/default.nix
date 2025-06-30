{ stdenv
, fetchurl
, lib
, unzip
,
}:

stdenv.mkDerivation rec {
  pname = "jib-cli";
  version = "0.13.0";

  src = fetchurl {
    url = "https://github.com/GoogleContainerTools/jib/releases/download/v${version}-cli/jib-jre-${version}.zip";
    sha256 = "0q843vrbxlzhb22s8yayc3jm6i9cg4afxf16fa0x7ri1c9va9xp8";
  };

  nativeBuildInputs = [ unzip ];

  dontBuild = true;

  installPhase = ''
    
        mkdir -p $out/bin
        unzip $src
        chmod +x jib-0.13.0/bin/jib
        mv jib-0.13.0/bin/jib $out/bin/
  '';

  meta = with lib; {
    description = "Container image builder for Java using Jib CLI";
    homepage = "https://github.com/GoogleContainerTools/jib";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
