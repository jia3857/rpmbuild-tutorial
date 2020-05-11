%define name hello
%define version 1.0
%define unmangled_version 1.0
%define release 1
%define _binaries_in_noarch_packages_terminate_build 0
%define _unpackaged_files_terminate_build 0

Summary: sample hello world program
Name: %{name}
Version: %{version}
Release: %{release}
License: GPL2
Source0: %{name}-%{unmangled_version}.tar.gz
Group: Applications/File
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-buildroot
Prefix: %{_prefix}
BuildArch: noarch

%define INSTALLDIR %{buildroot}/usr/local/bin

%description
This is a sample program to learn how to make a rpm package.

%prep
%setup -q

%build

%install
rm -rf %{INSTALLDIR}
mkdir -p %{INSTALLDIR}
cp -R * %{INSTALLDIR}

%clean
rm -rf %{buildroot}

%files
%defattr(-, root, root)
/usr/local/bin
