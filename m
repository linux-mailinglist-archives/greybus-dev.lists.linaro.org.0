Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IVwNMZUEVGrJgwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 23:18:13 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D93745EF4
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 23:18:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=VM2P7qgR;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA324409AC
	for <lists+greybus-dev@lfdr.de>; Sun, 12 Jul 2026 21:18:12 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	by lists.linaro.org (Postfix) with ESMTPS id DA08240A36
	for <greybus-dev@lists.linaro.org>; Sat, 11 Jul 2026 07:29:43 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1415490a12.0
        for <greybus-dev@lists.linaro.org>; Sat, 11 Jul 2026 00:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783754983; x=1784359783; darn=lists.linaro.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aECS2VE/JAEE5/6Q1Vp8WOCO6a5H3TmUFObfoCBKPk4=;
        b=VM2P7qgRaE0fxaFr4SCgAcRw5ZCCIUHr1acaOK0Cu2ZzIGXj/bdiVLXukFwGvYmrka
         TT0mV7WMEc2+UOkYrEmusYjva65iko0pm42K8/iI6mxE3uZlvHj5sLIcZ4zqLsle3tXW
         ssKSQD+ZKTOU4iDm8+SgNGuINliYgFI7B0DynVNGtSTreGM205MQkUZTkWO5LMf65MB1
         k5MBcBI48MKrxIJBMwacSO0jU5VusxTrgRl6aZP2XYV0VnNiiDOlDg7WPuulPGg5YrOL
         D61PLx5chFZIa+pkfjBhv2hC0z9W1VRu47+LXfi2ON4SYzFHqmXLFSxLlVcxOglGfiiJ
         Cndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783754983; x=1784359783;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aECS2VE/JAEE5/6Q1Vp8WOCO6a5H3TmUFObfoCBKPk4=;
        b=DDGZLIFMVTPxkvOL59Qo0l1bmLXk0ragcVnDfRVWCkbxUn+70cY+dEDTNQgQ4JpDJk
         Mj0+yf8V+oJtrsHo1C13J8uuCL6CADIyoKvoBo9CHvmTaOguTBFX9UlP81c/1yiAvi2g
         jt01wYqEliLW5FKrQtONl+yt+W9Aoe+6cnLDBQoatkaMLTjuYFRxktc88cSfVS5m/1V8
         B77R/AoeOiC/xoSvOpRU0iXJd9FVUV3rMxW9WYvjrbzRtewL9PtGHntj2zMjOHNGCuTq
         gmwlgoMYaVNWcaG8b+czgWsOezQHEVf8E9tx+JgYWT2ZH32mv4e5H2rjZwfRZH+zwgNr
         sXIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyHaA8p15Ywtd7lZw0M0s2qzSxrqMsrtY+2NA1aRBSEEDTuxanVR1McdK6L97Xa+UshWnY9ON9FevO5g==@lists.linaro.org
X-Gm-Message-State: AOJu0YzN+VEV++NaIlMFnN9mvfsWlDuQiKYr2CBPz18X5u55fFHlFdQF
	g7ufFHtFfhUB1nZ4ledCviu9GTn3XK6G9XBOmPra/GSwW2LJWt2361a2
X-Gm-Gg: AfdE7cltDYP+klWS/0gJb0+95oVXcNT0bF3EOwUNX/LfcUeIdXYuMWLxGTrlv2xPblJ
	4U7KVU2h796EXs9d5qseJCkzK4KDrOrj/Dvnw3lTqAelfiPHb3554SD60w74UeMPj7VWe5isMGw
	EHi1wUCdtyfCgvGdD0Bnws2rBakxgleGF+IVK52OZOcCX9m2qEeWO5mrTTu5zqqLvOMls4w4POP
	FC6sW4DO3/BFfiMIz719KY3ZHTvzhDMqBHJfefMLklPjY+Qovg0eonrDngHV7bwKeUWTHUVBXEp
	CMUTu1gi73uMsocdTkaE9wnabo8tAp68rJkFbre3eBbSDwJXW1RPVALl7VVl140ytIHOQfUhqCS
	Nl6NUTIraRBPeCb0/lraWupMLFVnzp2Hlp6UTb4+pBBHRL8mpgv6YPPhlPpn/vRpFU7dNvdVUv3
	5SysLfi6t/mlrBI1TylkzmW1E=
X-Received: by 2002:a05:6a21:4591:b0:3bf:6c08:2841 with SMTP id adf61e73a8af0-3c110775a5bmr2018390637.48.1783754982831;
        Sat, 11 Jul 2026 00:29:42 -0700 (PDT)
Received: from reply3_full.eml ([49.216.173.166])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b658a99afsm45004071c88.0.2026.07.11.00.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 00:29:42 -0700 (PDT)
Message-ID: <20260711152936.191.alvinhuang0603@gmail.com>
Date: Sat, 11 Jul 2026 15:29:36 +0800
From: Hao-Qun Huang <alvinhuang0603@gmail.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <alCiZxAXbPDq3P4e@stanley.mountain>
References: <20260704081613.434445-1-alvinhuang0603@gmail.com>
 <ak99bENMWC8saJL4@stanley.mountain>
 <20260710020644.6728.alvinhuang0603@gmail.com>
 <ak_tgJC8-d1HPKuV@stanley.mountain>
 <20260710124050.31335.alvinhuang0603@gmail.com>
 <alCiZxAXbPDq3P4e@stanley.mountain>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alvinhuang0603@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZZ7OGIKT7R5BCVZEA6UWTUFSYHAGAW2T
X-Message-ID-Hash: ZZ7OGIKT7R5BCVZEA6UWTUFSYHAGAW2T
X-Mailman-Approved-At: Sun, 12 Jul 2026 21:17:59 +0000
CC: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: hid: fix SET_REPORT return value
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZZ7OGIKT7R5BCVZEA6UWTUFSYHAGAW2T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[37];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[alvinhuang0603@gmail.com,greybus-dev-bounces@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alvinhuang0603@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92D93745EF4

Hi Dan,

Thanks, that makes sense now.  The point isn't just showing the code is
buggy, it's explaining why changing a years-old return value is safe, and
that belongs in the commit message rather than the thread.

I'll write that reasoning in next time (what checks the return, what
doesn't, and what could be affected) instead of leaving reviewers to ask.

Appreciate you taking the time to walk me through it.

Hao-Qun
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
