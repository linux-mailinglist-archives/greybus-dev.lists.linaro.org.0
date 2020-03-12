Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDE51833C2
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 15:51:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB8E4617EF
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 14:51:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AE91C61791; Thu, 12 Mar 2020 14:51:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,SPF_HELO_PASS,UNPARSEABLE_RELAY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4367561791;
	Thu, 12 Mar 2020 14:51:29 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F0BE960E9E
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 14:51:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E3DAD616FC; Thu, 12 Mar 2020 14:51:26 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by lists.linaro.org (Postfix) with ESMTPS id E3A1760E9E
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 14:51:25 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CEiioj166488;
 Thu, 12 Mar 2020 14:51:18 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2yp9v6d4x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 14:51:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02CEoN7L195490;
 Thu, 12 Mar 2020 14:51:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2yqkvmta4v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Mar 2020 14:51:18 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02CEpHi4020205;
 Thu, 12 Mar 2020 14:51:17 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Mar 2020 07:51:16 -0700
Date: Thu, 12 Mar 2020 17:51:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20200312145111.GO11561@kadam>
References: <20200311091906.22980-1-tiwai@suse.de>
 <20200311095814.GI14211@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311095814.GI14211@localhost>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003120080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9557
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003120080
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Takashi Iwai <tiwai@suse.de>, devel@driverdev.osuosl.org,
 greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Use scnprintf() for
 avoiding potential buffer overflow
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTA6NTg6MTRBTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFdlZCwgTWFyIDExLCAyMDIwIGF0IDEwOjE5OjA2QU0gKzAxMDAsIFRha2FzaGkg
SXdhaSB3cm90ZToKPiA+IFNpbmNlIHNucHJpbnRmKCkgcmV0dXJucyB0aGUgd291bGQtYmUtb3V0
cHV0IHNpemUgaW5zdGVhZCBvZiB0aGUKPiA+IGFjdHVhbCBvdXRwdXQgc2l6ZSwgdGhlIHN1Y2Nl
ZWRpbmcgY2FsbHMgbWF5IGdvIGJleW9uZCB0aGUgZ2l2ZW4KPiA+IGJ1ZmZlciBsaW1pdC4gIEZp
eCBpdCBieSByZXBsYWNpbmcgd2l0aCBzY25wcmludGYoKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jIHwgMjQgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCj4gCj4gVGhhbmtzIGZvciB0aGUgZml4Lgo+IAo+IFdvdWxkIHlvdSBtaW5kIHJlc2Vu
ZGluZyB3aXRoIGEgInN0YWdpbmc6IGdyZXlidXM6IGxvb3BiYWNrX3Rlc3Q6Igo+IHByZWZpeCBz
aW5jZSB0aGlzIGlzIG5vdCBhIHN1YnN5c3RlbSB3aWRlIGlzc3VlLCBidXIgcmF0aGVyIGEgYnVn
IGluIGEKPiBzcGVjaWZpYyB1c2VyLXNwYWNlIHRvb2w/CgpJJ20gc3VycHJpc2VkIHRoYXQgdXNl
ci1zcGFjZSBldmVuIGhhcyBzY25wcmludGYoKS4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
