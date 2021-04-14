Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D0835F49B
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 15:18:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2E0B06679F
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Apr 2021 13:18:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1E6CA667A1; Wed, 14 Apr 2021 13:18:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4A64E667A0;
	Wed, 14 Apr 2021 13:17:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 10EA366780
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 13:17:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E80FA6679F; Wed, 14 Apr 2021 13:17:41 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by lists.linaro.org (Postfix) with ESMTPS id CD16266780
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 13:17:40 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id l19so13180696ilk.13
 for <greybus-dev@lists.linaro.org>; Wed, 14 Apr 2021 06:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KR5tUi2Pjym92G8VJBGTvp1Vw9Vmq14ckbna/IAfvxY=;
 b=UXrWMFk588iyI7NmUfRgySWocOcGrxI/d2+u9JtRTU9FUqPR3l5bLp97UWgx/AHkP7
 zJsNHNelBzY4fpxpIIGERD7NenBDjYadzn+Aqc/8CUpsrIliAniWRMFg5a5lGjTR6tDo
 GD8u/TeyTiSbiTCNgGCOEokcSeEHVRS+B46A9AZgiAF56GUEYeFWztQCYLcMMHSugmYK
 t4KH6HXNtF+1TUT667iQ4fE2UDsSsHKxBQCd9dXXXIAKj+834gC7imO3TChBzKJoxAmc
 KfZoYSVP2U9KIt20eIi4ASKWmEZN952vwq7W6zbTdpVhBxCLD+ys2b6wtKQtkJNI2Oun
 BxoA==
X-Gm-Message-State: AOAM531DXx0DJiE9ulkITBgU+uIZzMfj6ngkQhZrQh7uNCgKljzdigIV
 c2La01kD7x94+eEOGxIf0rT3Fw==
X-Google-Smtp-Source: ABdhPJyb+zve3gy2tS0pVuePobkDcZJ6i03AHQgQ4GPnJtCEoPevEY/e3ov0ozoSq1Yrkb46lfVeqA==
X-Received: by 2002:a92:7f0c:: with SMTP id a12mr16080857ild.54.1618406260271; 
 Wed, 14 Apr 2021 06:17:40 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id h17sm3621738ilh.55.2021.04.14.06.17.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Apr 2021 06:17:39 -0700 (PDT)
To: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>,
 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
References: <20210406124259.GA96537@zhans> <YGxhrLZPIPjILWUH@kroah.com>
 <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <1607b040-6bc4-9a58-ae81-4ea0adf5885d@ieee.org>
Date: Wed, 14 Apr 2021 08:17:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, outreachy-kernel@googlegroups.com,
 linux-staging@lists.linux.dev, johan@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Match parentheses
	alignment
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gNC82LzIxIDEyOjIxIFBNLCBKb2UgUGVyY2hlcyB3cm90ZToKPiBPbiBUdWUsIDIwMjEtMDQt
MDYgYXQgMTU6MjcgKzAyMDAsIEdyZWcgS0ggd3JvdGU6Cj4+IE9uIFR1ZSwgQXByIDA2LCAyMDIx
IGF0IDA2OjQyOjU5UE0gKzA2MDAsIFpoYW5zYXlhIEJhZ2RhdWxldGt5enkgd3JvdGU6Cj4+PiBN
YXRjaCBuZXh0IGxpbmUgd2l0aCBvcGVuIHBhcmVudGhlc2VzIGJ5IGFkZGluZyB0YWJzL3NwYWNl
cwo+Pj4gdG8gY29uZm9ybSB3aXRoIExpbnV4IGtlcm5lbCBjb2Rpbmcgc3R5bGUuCj4+PiBSZXBv
cnRlZCBieSBjaGVja3BhdGNoLgo+IFtdCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvY2FtZXJhLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jYW1lcmEuYwo+IFtd
Cj4+PiBAQCAtMzc4LDggKzM3OCw4IEBAIHN0cnVjdCBhcF9jc2lfY29uZmlnX3JlcXVlc3Qgewo+
Pj4gIMKgI2RlZmluZSBHQl9DQU1FUkFfQ1NJX0NMS19GUkVRX01BUkdJTgkJMTUwMDAwMDAwVQo+
Pj4gICAKPj4+Cj4+PiAgwqBzdGF0aWMgaW50IGdiX2NhbWVyYV9zZXR1cF9kYXRhX2Nvbm5lY3Rp
b24oc3RydWN0IGdiX2NhbWVyYSAqZ2NhbSwKPj4+IC0JCXN0cnVjdCBnYl9jYW1lcmFfY29uZmln
dXJlX3N0cmVhbXNfcmVzcG9uc2UgKnJlc3AsCj4+PiAtCQlzdHJ1Y3QgZ2JfY2FtZXJhX2NzaV9w
YXJhbXMgKmNzaV9wYXJhbXMpCj4+PiArCQkJCQkgICBzdHJ1Y3QgZ2JfY2FtZXJhX2NvbmZpZ3Vy
ZV9zdHJlYW1zX3Jlc3BvbnNlICpyZXNwLAo+Pj4gKwkJCQkJICAgc3RydWN0IGdiX2NhbWVyYV9j
c2lfcGFyYW1zICpjc2lfcGFyYW1zKQo+Pgo+PiBBbmQgbm93IHlvdSB2aW9sYXRlIGFub3RoZXIg
Y29kaW5nIHN0eWxlIHJlcXVpcmVtZW50LCB3aGljaCBtZWFucwo+PiBzb21lb25lIHdpbGwgc2Vu
ZCBhbm90aGVyIHBhdGNoIHRvIGZpeCB0aGF0IHVwIGFuZCBhcm91bmQgYW5kIGFyb3VuZCBpdAo+
PiBnb2VzLi4uCj4gCj4gTm9uZSBvZiB0aGUgY29kaW5nIHN0eWxlIGRvY3VtZW50IGlzIGFuIGFj
dHVhbCByZXF1aXJlbWVudCBHcmVnLgo+IEl0J3MgYWxsIHJ1bGVzIG9mIHRodW1iLiAgVXNlZnVs
IHJ1bGVzLCBidXQgbm90IGhhcmQgYW5kIGZhc3QgcmlnaHQ/CgpJIGFncmVlIHdpdGggdGhpcywg
YnV0IHRoaXMgYW1iaWd1aXR5IGNhdXNlcyBzb21lIHByb2JsZW1zLgoKR3JleWJ1cyBpcyBhIGdv
LXRvIHBsYWNlIGZvciBqdXN0LXN0YXJ0aW5nIGRldmVsb3BlcnMgdG8Kd29yayB3aXRoIHNvbWUg
cmVhc29uYWJseSBnb29kICJyZWFsIiBjb2RlLiAgQnV0IHNvbWVvbmUKanVzdCBzdGFydGluZyBo
YXMgbm8gd2F5IG9mIGp1ZGdpbmcgd2hldGhlciB0aGUgd2FybmluZ3MKaXNzdWVkIGJ5IGNoZWNr
cGF0Y2ggYXJlIHJlYWwgb3Igbm90LiAgRXZlbiBleHBlcmllbmNlZApkZXZlbG9wZXJzIHdpbGwg
bGFjayB0aGUgaW5zaWdodCB0byBqdWRnZSB0aGlzIGlmIHRoZXkKYXJlIG1vZGlmeWluZyBvbiBh
IGxlc3MtZmFtaWxpYXIgcGFydCBvZiB0aGUga2VybmVsLgoKVGhlIHJlc3VsdC0tZm9yIEdyZXli
dXMgY2VydGFpbmx5LS1pcyBmYWlybHkgcmVndWxhcgpzdHJlYW0gcGF0Y2hlcyB0aGF0IHN1Z2dl
c3QgbWFraW5nIHRyaXZpYWwgY2hhbmdlcyBiYXNlZApvbiBjaGVja3BhdGNoIHJlY29tbWVuZGF0
aW9ucy4gIEFuZCB1bmZvcnR1bmF0ZWx5IGVhY2gKb25lIGlzIGRlc3RpbmVkIHRvIGJlIHJlamVj
dGVkIGJ5IHRoZSBtYWludGFpbmVycy4gIFRoaXMKaXMgbm8gZ29vZCBmb3IgYW55Ym9keS4KCkNh
biB5b3UgdGhpbmsgb2YgYSB3YXkgdG8gdHJ5IHRvIGZ1cnRoZXIgY2hhcmFjdGVyaXplCmhvdyAi
c2VyaW91cyIgYSB3YXJuaW5nIG1lc3NhZ2UgaXM/ICBJIHJlY29nbml6ZSB0aGF0CmV2ZW4gaWYg
KGZvciBleGFtcGxlKSB5b3UgaGFkIHNvbWV0aGluZyBsaWtlIDEtMTAgc2V2ZXJpdHkKc2NhbGUs
IHRoZSBzY2FsZSBtaWdodCBub3QgYmUgdW5pZm9ybSBhY3Jvc3MgdGhlIHdob2xlCmtlcm5lbCB0
cmVlLiAgUGVyaGFwcyAobGlrZSB0aGUgLVcgb3B0aW9ucyBmb3IgR0NDKSB0aGVyZQpjb3VsZCBi
ZSBhIHdheSB0byBzcGVjaWZ5IGluIGEgTWFrZWZpbGUgd2hpY2ggY2hlY2twYXRjaAptZXNzYWdl
cyBhcmUgcmVwb3J0ZWQvbm90IHJlcG9ydGVkPyAgSSBkb24ndCBjbGFpbSB0aGF0J3MKYSBnb29k
IHN1Z2dlc3Rpb24sIGJ1dCBpZiBJIGNvdWxkIG9wdGlvbmFsbHkgaW5kaWNhdGUKc29tZXdoZXJl
IHRoYXQgInR3byBjb25zZWN1dGl2ZSBibGFuayBsaW5lcyBpcyBPSyBmb3IKR3JleWJ1cyIgKG9u
ZSBleGFtcGxlIHRoYXQgY29tZXMgdG8gbWluZCkgSSBtaWdodCBkbyBzby4KCj4gVG8gbWUsIHRo
ZSBiaWdnZXN0IGlzc3VlIHdpdGggdGhpcyBjb2RlIGlzbid0IHdoZXRoZXIgb3Igbm90IHRoZQo+
IGNvZGUgaXMgYWxpZ25lZCBhdCBvcGVuIHBhcmVudGhlc2VzIG9yIHN0YXlzIHdpdGhpbiA4MCBj
b2x1bW5zLAo+IGJ1dCBpcyB0aGUgdXNlIG9mIDMwKyBjaGFyYWN0ZXIgbGVuZ3RoIGlkZW50aWZp
ZXJzLgoKSSBhZ3JlZSB3aXRoIHlvdSBvbiB0aGlzIG9uZS4uLiAgSSd2ZSB3b3JrZWQgd2l0aCBj
b2RlCmxpa2UgdGhhdCBhbmQgaXQncyB2ZXJ5IGRpZmZpY3VsdCB0byBtYWtlIGl0IHJlYWRhYmxl
LgpJJ3ZlIG1hZGUgYSBtZW50YWwgbm90ZSB0byBnbyBsb29rIGF0IHRoaXMgYW5kIHNlZSBpZgpJ
IGNhbiBtYWtlIGl0IGJldHRlci4gIEkgY2FuJ3Qgc2F5IHdoZW4gSSdsbCBnZXQgdG8gaXQKYnV0
IEkgdGhpbmsgaXQncyBhIGdvb2Qgc3VnZ2VzdGlvbi4KCgkJCQkJLUFsZXgKCj4gVXNpbmcgaWRl
bnRpZmllcnMgb2YgdGhhdCBsZW5ndGggbWFrZXMgdXNpbmcgODAgY29sdW1uLCBvciBldmVuCj4g
MTAwIGNvbHVtbiBsZW5ndGggbGluZXMgaW5mZWFzaWJsZS4KPiAKPiBQZXJoYXBzIHNlZWluZyBp
ZiBpbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaAo+IGNvdWxkIGJlIHVw
ZGF0ZWQgdG8gdXNlIHNob3J0ZXIgbGVuZ3RoIGlkZW50aWZpZXJzIG1pZ2h0IGJlIHVzZWZ1bC4K
PiAKPiBUaGUgbWVkaWFuIGxlbmd0aCBpZGVudGlmaWVyIHRoZXJlIGlzIH4yNSBjaGFycyBsb25n
IGFuZCB0aGUKPiBtYXhpbXVtIGxlbmd0aCBpZGVudGlmaWVyIGlzIH41MCBjaGFycy4KPiAKPiAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
