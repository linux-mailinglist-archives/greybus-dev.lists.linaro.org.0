Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 997F41E1D0B
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:15:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BAA5E61805
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:15:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AC599618D3; Tue, 26 May 2020 08:15:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 24D446602B;
	Tue, 26 May 2020 08:11:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 85F9561810
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 07:07:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7A25F65F82; Tue, 26 May 2020 07:07:40 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by lists.linaro.org (Postfix) with ESMTPS id 0872261810
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 07:07:39 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04Q72te3172987; Tue, 26 May 2020 03:07:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316yqhtjpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 03:07:33 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04Q72ajK171037;
 Tue, 26 May 2020 03:07:33 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 316yqhtjnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 03:07:33 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04Q764jX026533;
 Tue, 26 May 2020 07:07:31 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 316uf8j6d8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 07:07:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04Q77S5F62914722
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 May 2020 07:07:28 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3774FAE055;
 Tue, 26 May 2020 07:07:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57101AE05A;
 Tue, 26 May 2020 07:07:27 +0000 (GMT)
Received: from oc5311105230.ibm.com (unknown [9.145.70.211])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 May 2020 07:07:27 +0000 (GMT)
To: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com>
From: Ursula Braun <ubraun@linux.ibm.com>
Message-ID: <55c3d2eb-feff-bf33-235d-b89c0abef7b1@linux.ibm.com>
Date: Tue, 26 May 2020 09:07:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200525182608.1823735-9-kw@linux.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-25_12:2020-05-25,
 2020-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 cotscore=-2147483648 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005260049
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 26 May 2020 08:10:58 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: [greybus-dev] [PATCH 8/8] net/iucv: Use the new device_to_pm()
 helper to access struct dev_pm_ops
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

CgpPbiA1LzI1LzIwIDg6MjYgUE0sIEtyenlzenRvZiBXaWxjennFhHNraSB3cm90ZToKPiBVc2Ug
dGhlIG5ldyBkZXZpY2VfdG9fcG0oKSBoZWxwZXIgdG8gYWNjZXNzIFBvd2VyIE1hbmFnZW1lbnQg
Y2FsbGJhY3MKPiAoc3RydWN0IGRldl9wbV9vcHMpIGZvciBhIHBhcnRpY3VsYXIgZGV2aWNlIChz
dHJ1Y3QgZGV2aWNlX2RyaXZlcikuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+
CgpwbSBzdXBwb3J0IGlzIGdvaW5nIHRvIGJlIHJlbW92ZWQgKGZvciBzMzkwIGluIGdlbmVyYWwg
YW5kKSBmb3IKbmV0L2l1Y3YvaXVjdi5jIHdpdGggdGhpcyBuZXQtbmV4dCBwYXRjaDoKCmNvbW1p
dCA0YjMyZjg2YmYxNjczYWNiMTY0NDFkZDU1ZDdiMzI1NjA5ZjU0ODk3CkF1dGhvcjogSnVsaWFu
IFdpZWRtYW5uIDxqd2lAbGludXguaWJtLmNvbT4KRGF0ZTogICBUdWUgTWF5IDE5IDIxOjEwOjA4
IDIwMjAgKzAyMDAKCiAgICBuZXQvaXVjdjogcmVtb3ZlIHBtIHN1cHBvcnQKICAgIAogICAgY29t
bWl0IDM5NDIxNjI3NWM3ZCAoInMzOTA6IHJlbW92ZSBicm9rZW4gaGliZXJuYXRlIC8gcG93ZXIg
bWFuYWdlbWVudCBzdXBwb3J0IikKICAgIHJlbW92ZWQgc3VwcG9ydCBmb3IgQVJDSF9ISUJFUk5B
VElPTl9QT1NTSUJMRSBmcm9tIHMzOTAuCiAgICAKICAgIFNvIGRyb3AgdGhlIHVudXNlZCBwbSBv
cHMgZnJvbSB0aGUgczM5MC1vbmx5IGl1Y3YgYnVzIGRyaXZlci4KICAgIAogICAgQ0M6IEhlbmRy
aWsgQnJ1ZWNrbmVyIDxicnVlY2tuZXJAbGludXguaWJtLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6
IEp1bGlhbiBXaWVkbWFubiA8andpQGxpbnV4LmlibS5jb20+CiAgICBTaWduZWQtb2ZmLWJ5OiBE
YXZpZCBTLiBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cgo+IC0tLQo+ICBuZXQvaXVjdi9p
dWN2LmMgfCAzMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9u
ZXQvaXVjdi9pdWN2LmMgYi9uZXQvaXVjdi9pdWN2LmMKPiBpbmRleCA5YTJkMDIzODQyZmUuLjFh
MzAyOWFiN2MxZiAxMDA2NDQKPiAtLS0gYS9uZXQvaXVjdi9pdWN2LmMKPiArKysgYi9uZXQvaXVj
di9pdWN2LmMKCi4uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
