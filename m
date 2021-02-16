Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20A31CCF7
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 16:32:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 446C860C36
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 15:32:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 36B5A60FF9; Tue, 16 Feb 2021 15:32:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5F9C961887;
	Tue, 16 Feb 2021 15:31:58 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5435060C36
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 15:31:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 410716186A; Tue, 16 Feb 2021 15:31:56 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by lists.linaro.org (Postfix) with ESMTPS id 3D02760C36
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 15:31:55 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id u20so10526820iot.9
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 07:31:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bePSxi8P+mopBsJyKhZfJ0ylENCPirau9uKWEklbXfU=;
 b=GwtQ/s15vvnMF3wiwkpIYA6fV3L0fYblGfcVgXHMnYmsymEDxZa6J32FIfdkswcGtZ
 sv0x4xuWvIRubOr38zSyhs9ayW9wl6vONghDETpDDY4qKmwnaEM4NKL2pYMwLSgEeAIK
 kjSFt/EbgHuddyDobG5ysiBEWIvtxzZDAmJ9r4fZ03H95pa472E3z7iS4dMv3o4+26qO
 6O/j06d4+z5h7uSC/6JF88cOVwrR81FBdFb5qUa87HkpZo7STmtDpMShNOcVEG8yVNEg
 /QG40Wce/GVeJWBZT9iLw0M5u+N/syPLOFrocfZzHHl3h+TubNApu17gGIIN7/i/IvSA
 MBIw==
X-Gm-Message-State: AOAM532DTZkfY/O1WS4Tqld4H0F86iV/28J0pEeM23ajP0TgF969f0ZC
 Del360gk5JAIH+HUjcpMEhhPGQ==
X-Google-Smtp-Source: ABdhPJwoqQ029vOtAseft2NEwBaD7TLrVcTkRURos0sC8/KIa3QTnbWUF1Zy/JG8lsXU9hTL+Dcw5w==
X-Received: by 2002:a05:6638:58:: with SMTP id
 a24mr21031085jap.40.1613489514697; 
 Tue, 16 Feb 2021 07:31:54 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id o16sm1326647ilt.21.2021.02.16.07.31.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Feb 2021 07:31:54 -0800 (PST)
To: Manikantan Ravichandran <ravman1991@gmail.com>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
References: <20210212225035.GA16260@whach>
From: Alex Elder <elder@ieee.org>
Message-ID: <356e8c33-36d9-95f3-1a30-322e7ef6e168@ieee.org>
Date: Tue, 16 Feb 2021 09:31:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210212225035.GA16260@whach>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: minor code style fix
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

T24gMi8xMi8yMSA0OjUwIFBNLCBNYW5pa2FudGFuIFJhdmljaGFuZHJhbiB3cm90ZToKPiBjaGVj
a3BhdGNoIHdhcm5pbmcgZml4IGZvciBzdHJpbmcgc3BsaXQgYWNyb3NzIGxpbmVzCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWFuaWthbnRhbiBSYXZpY2hhbmRyYW4gPHJhdm1hbjE5OTFAZ21haWwuY29t
PgoKSSB0aGluayB3aGF0IHlvdSdyZSBkb2luZyBoZXJlICpsb29rcyogcmVhc29uYWJsZS4gIEJ1
dAp0aGUgR0JfQVVESU9fTUFOQUdFUl9NT0RVTEVfTkFNRV9MRU5fU1NDQU5GIHN5bWJvbCBpcwph
IChzdHJpbmcpIG51bWVyaWMgdmFsdWUgdGhhdCBpcyBhc3NvY2lhdGVkIHdpdGggdGhlCiJzIiB0
aGF0IGltbWVkaWF0ZWx5IGZvbGxvd3MgaXQuCgpTbyBJIGRvbid0IHRoaW5rIHlvdXIgY2hhbmdl
IG1ha2VzIHNlbnNlLCBnaXZlbiB0aGUKbWVhbmluZyBvZiB0aGUgbGluZSB5b3UncmUgY2hhbmdp
bmcuCgpUaGFua3MuCgoJCQkJCS1BbGV4Cgo+IC0tLQo+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fbWFuYWdlcl9zeXNmcy5jIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMKPiBpbmRleCBhYjg4MmNjNDliNDEuLmZjZDUxOGY5
NTQwYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2Vy
X3N5c2ZzLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX3N5
c2ZzLmMKPiBAQCAtMTgsOCArMTgsOCBAQCBzdGF0aWMgc3NpemVfdCBtYW5hZ2VyX3N5c2ZzX2Fk
ZF9zdG9yZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKPiAgIAlzdHJ1Y3QgZ2JfYXVkaW9fbWFuYWdl
cl9tb2R1bGVfZGVzY3JpcHRvciBkZXNjID0geyB7MH0gfTsKPiAgIAo+ICAgCWludCBudW0gPSBz
c2NhbmYoYnVmLAo+IC0JCQkibmFtZT0lIiBHQl9BVURJT19NQU5BR0VSX01PRFVMRV9OQU1FX0xF
Tl9TU0NBTkYgInMgIgo+IC0JCQkidmlkPSVkIHBpZD0lZCBpbnRmX2lkPSVkIGkvcCBkZXZpY2Vz
PTB4JVggby9wIGRldmljZXM9MHglWCIsCj4gKwkJCSJuYW1lPSUiIEdCX0FVRElPX01BTkFHRVJf
TU9EVUxFX05BTUVfTEVOX1NTQ0FORgo+ICsJCQkicyB2aWQ9JWQgcGlkPSVkIGludGZfaWQ9JWQg
aS9wIGRldmljZXM9MHglWCBvL3AgZGV2aWNlcz0weCVYIiwKPiAgIAkJCWRlc2MubmFtZSwgJmRl
c2MudmlkLCAmZGVzYy5waWQsICZkZXNjLmludGZfaWQsCj4gICAJCQkmZGVzYy5pcF9kZXZpY2Vz
LCAmZGVzYy5vcF9kZXZpY2VzKTsKPiAgIAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vZ3JleWJ1cy1kZXYK
