Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AF27624905F
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 23:53:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D229D61718
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 21:53:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BFDD4619D1; Tue, 18 Aug 2020 21:53:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B3D0618E0;
	Tue, 18 Aug 2020 21:53:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E2ADB60C15
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 21:53:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D21B561718; Tue, 18 Aug 2020 21:53:01 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by lists.linaro.org (Postfix) with ESMTPS id 6D90160C15
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 21:53:00 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id q14so18972249ilj.8
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 14:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y+eND3yUn7afYyyUX+ZOLNk8wIrEfdj82iS2j0XFFq0=;
 b=mvtcsak8QoIOvnX8c/xloyGQT6atNo5cuf/8BySf94ooiYLe8bqSUh1O7FTIPBBV+K
 5B6i15DRTvtKFsiILvSqG8QF78lSYLEMrVGCorV8a+bYJKCmP0AaO2QnHwmZoCpnJJke
 4PZpm4bP98nfkoCKWa4MN0xH6P/FxXGReE6nhyrqxyIU98G+xpng5pYBjLID2osii1hr
 h0z+FkTgCzLVKLxVpnt/W/9NPb7ufDfHgBU0tksOpgrZJ4d1YsmBtqf3+s56gTKGRYwZ
 H1FwnS7b8o+TbI0Oe4RIgVgAYtFN2QD2ODI2G8P/DvlhdBTsYPMQafASb84vpIio7xN7
 wfQg==
X-Gm-Message-State: AOAM532c5sWneyS9pLkh+VKcKIvc4hVkj4j/TiwWSIJbGfQzbUNPjfCE
 lE8sp9s3w1EVp0Hl7BoAHtBQuzG0iWqxcn0jzIE1
X-Google-Smtp-Source: ABdhPJxLjWSNd7ynfl1wvpKbJ3WBA4UNitdVRIp3M1T7zGJJdKR2f+uQeJOcY3J32rROZjl8LKN8lBYVvmvS91peslo=
X-Received: by 2002:a92:9955:: with SMTP id p82mr19435772ili.186.1597787579879; 
 Tue, 18 Aug 2020 14:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
 <20200818152426.GA713928@kroah.com>
In-Reply-To: <20200818152426.GA713928@kroah.com>
From: Vaishnav M A <vaishnav@beagleboard.org>
Date: Wed, 19 Aug 2020 03:22:48 +0530
Message-ID: <CALudOK4jgtJiB8sn4CsDm2c=va=d8M7ocoa55f=NV9sTaBHJJg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: =?UTF-8?Q?Ivan_Rajkovi=C4=87?= <rajkovic@mikroe.com>, robh@kernel.org,
 elder@kernel.org, Drew Fustini <drew@beagleboard.org>, arnd@arndb.de,
 mchehab+huawei@kernel.org, linux-kernel@vger.kernel.org, johan@kernel.org,
 greybus-dev@lists.linaro.org, Robert Nelson <robertcnelson@beagleboard.org>,
 davem@davemloft.net, zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [RFC PATCH v2 0/3] mikroBUS driver for add-on
	boards
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

T24gVHVlLCBBdWcgMTgsIDIwMjAgYXQgODo1NCBQTSBHcmVnIEtIIDxncmVna2hAbGludXhmb3Vu
ZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEF1ZyAxOCwgMjAyMCBhdCAwNjoxODoxMlBN
ICswNTMwLCBWYWlzaG5hdiBNIEEgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBUaGlzIFBhdGNoIHNl
cmllcyBpcyBhbiB1cGRhdGUgdG8gdGhlIG1pa3JvQlVTIGRyaXZlcgo+ID4gUkZDIHYxIFBhdGNo
IDogaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNy8yNC81MTggLgo+Cj4gUGxlYXNlIHVzZSBs
b3JlLmtlcm5lbC5vcmcgZm9yIGxpbmtzLCB3ZSBoYXZlIG5vIGlkZWEgaWYgbGttbC5vcmcgd2ls
bAo+IGJlIHdvcmtpbmcgdG9tb3Jyb3cgb3Igbm90IDopCj4KSGkgR3JlZywKClRoYW5rcywgd2ls
bCB1c2UgbG9yZS5rZXJuZWwub3JnIGZvciB0aGUgbGlua3MsIGF0dGFjaGluZyB0aGUgY29ycmVz
cG9uZGluZwpsaW5rIHRvIHRoZSB2MSBSRkMgcGF0Y2ggdGhyZWFkIGZvciByZWZlcmVuY2U6Cmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA3MjQxMjA2MzcuR0E0MjcyODRAdmFpc2hu
YXYtVmlydHVhbEJveC8KCj4gPiBUaGUgbWlrcm9idXMgZHJpdmVyIGlzIHVwZGF0ZWQgdG8gYWRk
IG1pa3JvYnVzIHBvcnRzIGZyb20gZGV2aWNlLXRyZWUKPiA+IG92ZXJsYXlzLCB0aGUgZGVidWcg
aW50ZXJmYWNlcyBmb3IgYWRkaW5nIG1pa3JvYnVzIHBvcnRzIHRocm91Z2ggc3lzRlMKPiA+IGlz
IHJlbW92ZWQsIGFuZCB0aGUgZHJpdmVyIGNvbnNpZGVycyB0aGUgZXh0ZW5kZWQgdXNhZ2Ugb2Yg
bWlrcm9idXMKPiA+IHBvcnQgcGlucyBmcm9tIHRoZWlyIHN0YW5kYXJkIHB1cnBvc2VzLgo+Cj4g
SSBkb24ndCBrbm93IHdoYXQgInByb3BlcnRpZXMiIGFuZCAiZGV2aWNlIiBtZWFuIHdpdGggcmVn
YXJkcyB0byB0aGluZ3MKPiBoZXJlLCBhbnkgY2hhbmNlIHlvdSBjYW4gcHJvdmlkZSBhIHBhdGNo
IHRvIHRoZSBncmV5YnVzIHNwZWMgaXRzZWxmIHRoYXQKPiBhZGRzIHRoaXMgaW5mb3JtYXRpb24g
c28gd2UgY2FuIGJldHRlciB1bmRlcnN0YW5kIHRoZSByZWFzb25pbmcgaGVyZSB0bwo+IHNlZSBp
ZiB0aGUga2VybmVsIGNoYW5nZXMgbWF0Y2ggdXAgd2l0aCB0aGUgZ29hbHM/Cj4KPiB0aGFua3Ms
Cj4KPiBncmVnIGstaApTdXJlLCBJIHdpbGwgYWRkIGEgcGF0Y2ggdG8gdGhlIGdyZXlidXMtc3Bl
YyB0byBkZXNjcmliZSB0aGUgbmV3IGRlc2NyaXB0b3JzLAp0aGUgcHJvcGVydHkgYW5kIGRldmlj
ZSBkZXNjcmlwdG9ycyBhcmUgaW50cm9kdWNlZCB0byBhZGQgaW5mb3JtYXRpb24KYWJvdXQgdGhl
IFNQSS9JMkMvVUFSVCBjaGlwL3NlbnNvciB3aGljaCBpcyByZXF1aXJlZCBieSB0aGUgY29ycmVz
cG9uZGluZwpkZXZpY2UgZHJpdmVycywgV2l0aCB0aGVzZSBkZXNjcmlwdG9ycywgaXQgd2lsbCBi
ZSBwb3NzaWJsZSB0byBkZXNjcmliZSBkZXZpY2VzCm9uIEkyQywgU1BJLCBVQVJULCBldGMuIGJl
aGluZCBhIGdyZXlidXMgZGV2aWNlIHNvIGFzIHRvIGJpbmQgZXhpc3Rpbmcga2VybmVsCmRyaXZl
cnMgdG8gdGhlbSwgVGhpcyBpcyBub3Qgd2hhdCBpcyBjdXJyZW50bHkgYmVpbmcgZG9uZSB3aXRo
aW4gdGhlIG1pa3JvQlVTCmRyaXZlciwgbm93IGl0IHRyaWVzIHRvIGluc3RhbnRpYXRlIGRldmlj
ZXMgb24gYWN0dWFsIEkyQywgU1BJLCBVQVJUIGZyb20KZGVzY3JpYmluZyBtYW5pZmVzdHMsIGJ1
dCB0aGUgdWx0aW1hdGUgZ29hbCBpcyB0byBkZXNjcmliZSB0aGUgZGV2aWNlcyBvbgpJMkMvU1BJ
L1VBUlQgYmVoaW5kIGEgZ3JleWJ1cyBkZXZpY2UsIHRodXMgZW5hYmxpbmcgdG8gYXR0YWNoIGV4
aXN0aW5nCmtlcm5lbCBkcml2ZXJzIHRvIGRldmljZXMgcHJlc2VudCBpbiBhZGQtb24gYm9hcmRz
IGF0dGFjaGVkIHRvIG1pa3JvQlVTCnBvcnRzIGFkZGVkIHZpYSBncmV5YnVzLgoKU2hhbGwgSSBz
dWJtaXQgYSBwdWxsIHJlcXVlc3QgdG8gaHR0cHM6Ly9naXRodWIuY29tL3Byb2plY3RhcmEvZ3Jl
eWJ1cy1zcGVjCmZvciB0aGUgc3BlY3MsIGlzIHRoZXJlIGEgZGlmZmVyZW50IG9mZmljaWFsIHVw
c3RyZWFtIHRvIGdyZXlidXMtc3BlYz8KClRoYW5rcyBhbmQgUmVnYXJkcywKVmFpc2huYXYgTSBB
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
