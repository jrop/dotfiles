# Oracle
# export OCI_LIB_DIR=/usr/local/instantclient/12.1.0.2.0
# export OCI_INC_DIR=/usr/local/instantclient/12.1.0.2.0/sdk/include
export OCI_LIB_DIR=/usr/local/instantclient/11.2.0.4.0
export OCI_INC_DIR=/usr/local/instantclient/11.2.0.4.0/sdk/include

export DYLD_LIBRARY_PATH=/usr/local/instantclient/11.2.0.4.0:$DYLD_LIBRARY_PATH
export PATH=/usr/local/instantclient/11.2.0.4.0:$PATH

export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
setjdk() {
	export JAVA_HOME=$(/usr/libexec/java_home -v $1)
}

# Android
ANDROID=~/android-sdk
export PATH=$PATH:$ANDROID/ndk-bundle:$ANDROID/tools:$ANDROID/platform-tools:/Users/jrapodac/opt/lib/apktool:/Users/jrapodac/opt/lib/dex2jar-0.0.9.15
