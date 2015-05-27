#!/bin/bash
#
# Copyright (C) 2013 Intel Corporation
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# * Redistributions of works must retain the original copyright notice, this list
#   of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the original copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of Intel Corporation nor the names of its contributors
#   may be used to endorse or promote products derived from this work without
#   specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY INTEL CORPORATION "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL INTEL CORPORATION BE LIABLE FOR ANY DIRECT,
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
# OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Authors:
#        Cao, Jenny <jenny.q.cao@intel.com>
#        Yue, jianhui <jianhuix.a.yue@intel.com>
#        Lin, Wanmnig <wanmingx.lin@intel.com>

path=$(dirname $(dirname $0))
source $path/scripts/xwalk_common.sh
if [[ $# != 1 ]]; then
    echo "Please add parameter packagename!"
    exit 1
fi
PACKAGENAME="$path/widgetpackaging/w3c/$1"
p_name=$1
APP_NAME=$(basename ${p_name%%.wgt})
find_app $APP_NAME
if [[ ! -z "$pkgids" ]]; then
  uninstall_app $APP_NAME
  find_app $APP_NAME
  if [[ ! -z "$pkgids" ]]; then
    echo -e  "Fail to uninstall the existed widget!"
    exit 1
  fi
fi
install_app $PACKAGENAME
find_app $APP_NAME
if [[ -z "$pkgids" ]]; then
  echo -e  "Fail to install the widget!"
  exit 1
fi
launch_app $appid
App_Status=`app_launcher -r $appid | grep "not running"`
if [[ -z "$App_Status" ]]; then
  echo "The widget is launched successfully"
  uninstall_app $APP_NAME
  exit 0
else
  echo "The widget is not launched"
  uninstall_app $APP_NAME
  exit 1
fi
