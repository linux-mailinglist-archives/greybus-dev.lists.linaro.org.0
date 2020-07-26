Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4E522E2D1
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jul 2020 23:54:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F7326601A
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jul 2020 21:54:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 00C4F665C5; Sun, 26 Jul 2020 21:54:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08C1166597;
	Sun, 26 Jul 2020 21:54:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 900E860733
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 21:54:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6CF7E66539; Sun, 26 Jul 2020 21:54:19 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by lists.linaro.org (Postfix) with ESMTPS id 40FBD60733
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 21:54:18 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id z3so1233356ilh.3
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jul 2020 14:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qbO72KNQsN1uo9s1oqMFM1YRWkl2m1XWlF1kgUkKGp0=;
 b=oZZfRdPClRHEKs4s70Mcq3QkaqDXklqUiwT5XXc2na1ubpUNHS7WQ/Tdl4Zz29Ay/I
 u+55SVNyJSDM68ygEyJyEUIxV0k2GHQmRkj/tm+cLIGdHrjlM3fvb9Td2zH4qsQTwvvY
 yWQc1UACbmUA4710u6cdHytpGAZehr65Nka74Q6btcjP7caoFRFVJEN8Aj+P5fxZgOoC
 69tlkmFbol9w8ZHuqMUZa3jlbeyhrvM1PmZnCOVNWvGlT6RgDaoVOPZ6j+EA8y+L1Y8z
 b7YMqaAYjKnMBhx12cS9O8Yvav7BXL6qQRCjadERYVYWa9JCHJf/7tjROIvW0XL2Y0Rq
 Kz0A==
X-Gm-Message-State: AOAM530FyFZMcTbfZm4Q+Tx/m6ZNocz1WpUASdQRcKWSgGhBesu9NC80
 0LbC13AZQemytlfFFb4L0YYWOrMU
X-Google-Smtp-Source: ABdhPJzXPAxSdoJRP3ENuN+EA7N7oxkg3azTG1Uih+Vi8wnVNgMAOGnCXPHCMkrNl3Wwaq+8Le0fFw==
X-Received: by 2002:a92:c90c:: with SMTP id t12mr3036399ilp.222.1595800457780; 
 Sun, 26 Jul 2020 14:54:17 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id u21sm1073907ili.34.2020.07.26.14.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jul 2020 14:54:17 -0700 (PDT)
To: Vaishnav M A <vaishnav@beagleboard.org>
References: <20200724120637.GA427284@vaishnav-VirtualBox>
 <15cab987-6eaa-9137-0f70-4735b3fea87f@linaro.org>
 <CALudOK6SrEKDdDv4CwPdZqH_KGHxwotbjgajo4dzf8FY22UVEA@mail.gmail.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <9ccd5a70-713b-f620-7f95-8754181e569a@linaro.org>
Date: Sun, 26 Jul 2020 16:54:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALudOK6SrEKDdDv4CwPdZqH_KGHxwotbjgajo4dzf8FY22UVEA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, elder@kernel.org,
 Drew Fustini <drew@beagleboard.org>, arnd@arndb.de, mchehab+huawei@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Robert Nelson <robertcnelson@beagleboard.org>, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [PATCH] RFC : mikroBUS driver for add-on boards
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

T24gNy8yNi8yMCAyOjEyIFBNLCBWYWlzaG5hdiBNIEEgd3JvdGU6Cj4gSSBoYXZlIGdvbmUgdGhy
b3VnaCBhbGwgdGhlIHN1Z2dlc3Rpb25zIGFuZCBiZSBiYWNrIHdpdGggYW4KPiB1cGRhdGVkIHZl
cnNpb24gb2YgdGhlIGRyaXZlciBwYXRjaCB3aXRoIHRoZSBjaGFuZ2VzIGFkZGVkLgoKR3JlYXQh
ICBUYWtlIHlvdXIgdGltZS4gIChTZXJpb3VzbHksIHRha2UgeW91ciB0aW1lLCBiZWNhdXNlCkkg
aGF2ZSB0byBjYXJ2ZSBvdXQgdGltZSBpbiBteSBvd24gc2NoZWR1bGUgZm9yIHJldmlld2luZyEp
CgoJCQkJCS1BbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
