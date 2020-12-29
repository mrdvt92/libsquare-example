Name:          square
Summary:       square
Version:       0.03
Release:       1%{?dist}
License:       bsd
Group:         System Environment/Daemons
URL:           http://yumrepo.veritracks.com/yumrepo/
Source0:       %{name}-%{version}.tar.gz
BuildRequires: gcc
BuildRequires: make
Requires:      perl(FFI::Platypus)

%description 
square

%prep
%setup -q

%build
make

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT%{_bindir}/
cp square_app    $RPM_BUILD_ROOT%{_bindir}/
cp square_app.pl $RPM_BUILD_ROOT%{_bindir}/

mkdir -p $RPM_BUILD_ROOT%{_libdir}/
cp lib%{name}.so $RPM_BUILD_ROOT%{_libdir}/

%files
%defattr(0644,root,root,-)
%attr(0755,root,root) %{_bindir}/square_app
%attr(0755,root,root) %{_bindir}/square_app.pl
%attr(0644,root,root) %{_libdir}/lib%{name}.so

%clean
rm -rf $RPM_BUILD_ROOT

%changelog
