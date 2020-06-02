Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 864B01EBC34
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 14:58:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A3CC66198E
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 12:58:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 97CB5619A8; Tue,  2 Jun 2020 12:58:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8FA7061945;
	Tue,  2 Jun 2020 12:57:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 78E3660E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:57:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4CC2761943; Tue,  2 Jun 2020 12:57:48 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by lists.linaro.org (Postfix) with ESMTPS id 5B07960E97
 for <greybus-dev@lists.linaro.org>; Tue,  2 Jun 2020 12:57:47 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052Cq4g5026266;
 Tue, 2 Jun 2020 12:57:34 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 31dkrugwvw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 02 Jun 2020 12:57:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 052Crvvq086376;
 Tue, 2 Jun 2020 12:57:33 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 31c25ntsb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Jun 2020 12:57:33 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 052CvShi031357;
 Tue, 2 Jun 2020 12:57:28 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 02 Jun 2020 05:57:27 -0700
Date: Tue, 2 Jun 2020 15:57:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200602125715.GI30374@kadam>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
 <77cfc355b87ee21636430f787764700de1983f38.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77cfc355b87ee21636430f787764700de1983f38.1591040859.git.vaibhav.sr@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006020091
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9639
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 cotscore=-2147483648 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006020091
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alex Elder <elder@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, greybus-dev@lists.linaro.org,
 Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [RESEND PATCH v1 6/6] staging: greybus: audio:
 Enable GB codec, audio module compilation.
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

T24gVHVlLCBKdW4gMDIsIDIwMjAgYXQgMTA6NTE6MTVBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IEN1cnJlbnRseSwgR0IgY29kZWMgYW5kIGF1ZGlvIG1vZHVsZSBpcyBjb25kaXRp
b25hbGx5IGNvbXBpbGVkIGJhc2VkIG9uCj4gR1JFWUJVU19BVURJT19NU004OTk0LiBIb3dldmVy
LCBhdWRpbyBtb2R1bGUgaXMgbm90IGRlcGVuZGVudCBvbiBNU004OTk0Cj4gcGxhdGZvcm0gYW5k
IGNhbiBiZSB1c2VkIGdlbmVyaWNhbGx5IHdpdGggYW55IHBsYXRmb3JtIHRoYXQgZm9sbG93cwo+
IEdCIEF1ZGlvIGNsYXNzIHNwZWNpZmljYXRpb24uCj4gCj4gQWxzbywgR0IgY29kZWMgZHJpdmVy
IGNvcnJlc3BvbmRzIHRvIGR1bW15IGNvZGVjIHJlcHJlc2VudGVkIGJ5IEkyUyBwb3J0Cj4gYXZh
aWxhYmxlIG9uIFRvc2hpYmEgQVAgQnJpZGdlLiBBZGRlZCBjb25maWcgb3B0aW9uIGZvciB0aGUg
c2FtZSBpbgo+IGtjb25maWcgZmlsZSBhbmQgYWNjb3JkaW5nbHkgdXBkYXRlZCBNYWtlZmlsZS4K
PiAKClRoaXMgY29tbWl0IG1lc3NhZ2Ugd2FzIGEgYml0IGNvbmZ1c2luZyB0byBtZS4gIEp1c3Qg
c2F5OgoKIkN1cnJlbnRseSB5b3UgY2FuJ3QgZW5hYmxlIHRoZSBHcmV5IEJ1cyBBdWRpbyBDb2Rl
YyBiZWNhdXNlIHRoZXJlIGlzIG5vCmVudHJ5IGZvciBpdCBpbiB0aGUgS2NvbmZpZyBmaWxlLiAg
T3JpZ2luYWxseSB0aGUgY29uZmlnIG5hbWUgd2FzIGdvaW5nCnRvIGJlIEFVRElPX01TTTg5OTQg
YnV0IHRoYXQncyBub3QgY29ycmVjdCBiZWNhdXNlIG90aGVyIHR5cGVzIG9mCmhhcmR3YXJlIGFy
ZSBzdXBwb3J0ZWQgbm93LiAgSSBoYXZlIGNob3NlbiB0aGUgbmFtZSBBVURJT19BUEJfQ09ERUMK
aW5zdGVhZC4gIEFsc28gSSBoYWQgdG8gdXBkYXRlIHRoZSBkZXBlbmRlbmNpZXMgZm9yIEdSRVlC
VVNfQVVESU8gdG8KbWFrZSB0aGUgY29tcGlsZSB3b3JrLiIKCk90aGVyd2lzZSB0aGlzIGxvb2tz
IGZpbmUuCgpyZWdhcmRzLApkYW4gY2FycGVudGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
