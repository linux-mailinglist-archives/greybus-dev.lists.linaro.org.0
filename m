Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3669C90A
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 08:14:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61573617DA
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Aug 2019 06:14:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 531EE617D1; Mon, 26 Aug 2019 06:14:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 971EA60E97;
	Mon, 26 Aug 2019 06:13:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A04A9609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:13:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8E3EB60E91; Mon, 26 Aug 2019 06:13:57 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by lists.linaro.org (Postfix) with ESMTPS id 9040D609A2
 for <greybus-dev@lists.linaro.org>; Mon, 26 Aug 2019 06:13:56 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id y8so9492010plr.12
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 23:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K4xTqVT3gSlsyJrTOrya5b7nDs+y3cG9ZLcN0dcxs5A=;
 b=Xe9oWA1vrmiLq8QC8KAXColtl/abPZReKpF90t6AEWJsW/Ofqqftcn0msvY9AqKa9R
 kyYPvGLxwwJxpy66/mcbdN6INbEGMxlEYRwHhNSqXmi/TSrJcLKfrnYc5VssNKQjaM4U
 4RPZIm+lhw5UD9T3dL6sh6smH6SLootVyqBUqSqc5lsOYUDTO/BcnuLRbFvmEkgEj0z8
 3xXSv30ZACURBL+VQaPVouWwxdrlTJXFcZwDlzkbvV2kIszw3wfzg3aT4QQBe5CtRXrL
 tnndeayVUN8f3X/EPheWvZiAlR1wAld5icsvvn9cuQMSbt8N9NtiP5PS3cMIe+9Rbihc
 HxbQ==
X-Gm-Message-State: APjAAAWqWrTZCE5bgv4pnyL+C3GFmJJnMjczdPer6ZyRKyZshgzPqs7h
 6UdcxVwwR9XkNZbeMQHwDZ//Q1df
X-Google-Smtp-Source: APXvYqxCNCxrBS4sn6xq67avgshvFQc+3q2JEbYVJ7Kjldm2lweFl1UnWd6Z6wIZ29ZSdOud3q8IqA==
X-Received: by 2002:a17:902:e584:: with SMTP id
 cl4mr16930492plb.160.1566800035845; 
 Sun, 25 Aug 2019 23:13:55 -0700 (PDT)
Received: from localhost ([122.172.76.219])
 by smtp.gmail.com with ESMTPSA id c12sm14551590pfc.22.2019.08.25.23.13.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 23:13:54 -0700 (PDT)
Date: Mon, 26 Aug 2019 11:43:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190826061353.em5rrwu342n6slnk@vireshk-i7>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-9-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825055429.18547-9-gregkh@linuxfoundation.org>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH 8/9] staging: greybus: move the greybus
 core to drivers/greybus
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

T24gMjUtMDgtMTksIDA3OjU0LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gVGhlIEdyZXli
dXMgY29yZSBjb2RlIGhhcyBiZWVuIHN0YWJsZSBmb3IgYSBsb25nIHRpbWUsIGFuZCBoYXMgYmVl
bgo+IHNoaXBwaW5nIGZvciBtYW55IHllYXJzIGluIG1pbGxpb25zIG9mIHBob25lcy4gIFdpdGgg
dGhlIGFkdmVudCBvZiBhCj4gcmVjZW50IEdvb2dsZSBTdW1tZXIgb2YgQ29kZSBwcm9qZWN0LCBh
bmQgYSBudW1iZXIgb2YgbmV3IGRldmljZXMgaW4gdGhlCj4gd29ya3MgZnJvbSB2YXJpb3VzIGNv
bXBhbmllcywgaXQgaXMgdGltZSB0byBnZXQgdGhlIGNvcmUgZ3JleWJ1cyBjb2RlCj4gb3V0IG9m
IHN0YWdpbmcgYXMgaXQgcmVhbGx5IGlzIGdvaW5nIHRvIGJlIHdpdGggdXMgZm9yIGEgd2hpbGUu
Cj4gCj4gQ2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiBDYzogQWxleCBFbGRl
ciA8ZWxkZXJAa2VybmVsLm9yZz4KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+
IENjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KCkFja2VkLWJ5OiBWaXJl
c2ggS3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPgoKLS0gCnZpcmVzaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
