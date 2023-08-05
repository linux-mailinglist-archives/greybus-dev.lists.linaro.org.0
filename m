Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BA453771074
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Aug 2023 18:14:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B70E3EBB0
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Aug 2023 16:14:41 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by lists.linaro.org (Postfix) with ESMTPS id 493ED3EBB0
	for <greybus-dev@lists.linaro.org>; Sat,  5 Aug 2023 16:14:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=ZdXi5xrr;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.208.180 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso48041101fa.0
        for <greybus-dev@lists.linaro.org>; Sat, 05 Aug 2023 09:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691252074; x=1691856874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4X5LeqFwRZ12z0t0SRAdd4hSB7565qztxHR0V8YIUsQ=;
        b=ZdXi5xrrQrMtP7oPExcSSvfWcYTjypvLAPSjl6TaUplewzQ3PZg1/F8E4b1DxABhK/
         eOpiCyCZzJYxQlGUdxzei4fKwD6Jlp1PYfStSdRLtJY4zXbShncJmrFN/9n5MQhmvbx0
         hCEeF98ays3a0OaJ5kIQbbOfUp3DoxRzwsafdlVYOX1lvk9W1s1QrPpRIV+XLKtImvU5
         Nd0Ji4MBd1kDTvqVtRCh/QmC99O2Tnp0onrQuV01AjIQ4fBkVJgam7YDxuf7Pzz+ILmP
         QoQST+xnqyhowG59TMHZFRGNX9DQ8EMzBAfk5FsoMgu2V80xizPthQcFSpV0dYZOJiqf
         WT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691252074; x=1691856874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X5LeqFwRZ12z0t0SRAdd4hSB7565qztxHR0V8YIUsQ=;
        b=ZQQTPENI83iMQullev2Zoftw/lORry6O14SY+JNxR3KBkVz4urp46IH+HdP047XtZp
         iswd+O3LFAQppRFCiD9jdgedUQcnzinkOAc2o8P3MU2TC2MMWDiAESdnoJt/+qp6lwg6
         KELYyM9hyjumDCafnZQPHfgQUPk93xTceEfbIbC88E+SiIq6M8b+6w6kxSgHasx6UIq6
         ilTimqtA50Hl4AzJDmqWqwn+esqSNwqPLNLHPFApAVz8PYX2RrTo/+qWNePRZFb6pQ5I
         TlWgSqWLiiHNz6hN3f50JeFBqAwGwgi+01Mz0kZRsQYefKAEgeEZ+0z9I6wxJA8d4GBK
         WPZQ==
X-Gm-Message-State: AOJu0YzB7q0t1hE5prhIG7OLl5YOkMxLFpB3B3MAmrFdkDgbi64gmtCJ
	JKuCXLZ6CxBJxBQl3JiUU9TYNWfS
X-Google-Smtp-Source: AGHT+IGtX5wIfl3tY9j9ku33ZEqA5uzIH68ru1YtY4ppk1a7rI0YhJOPsqCGL7ic5oeTID5GaICrbg==
X-Received: by 2002:a2e:9694:0:b0:2b6:ec2b:7d77 with SMTP id q20-20020a2e9694000000b002b6ec2b7d77mr3221194lji.6.1691252073817;
        Sat, 05 Aug 2023 09:14:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r5-20020a056000014500b00317dd7b96e7sm1554508wrx.23.2023.08.05.09.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 09:14:33 -0700 (PDT)
Date: Sat, 5 Aug 2023 19:14:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Madhumitha Prabakaran <madhumithabiw@gmail.com>
Message-ID: <553ef4ed-9f0a-4ab1-b7f2-0175f6cb4dca@kadam.mountain>
References: <20230804203134.GA618419@madhu-kernel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230804203134.GA618419@madhu-kernel>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 493ED3EBB0
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.98 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[linaro.org:dkim];
	BAYES_HAM(-2.98)[99.91%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.180:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: IHJB4G6JXG3AXLGS4OGWSLD4I7GALA7A
X-Message-ID-Hash: IHJB4G6JXG3AXLGS4OGWSLD4I7GALA7A
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Refactor gb_audio_gb_get_topology() into separate calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IHJB4G6JXG3AXLGS4OGWSLD4I7GALA7A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 04, 2023 at 03:31:34PM -0500, Madhumitha Prabakaran wrote:
> Refactor gb_audio_gb_get_topology() into separate calls for better modularity.
> 

This is too vague.  Just say "There is a comment which says 'Split into
separate calls' so I have done it."  But actually, please just delete
the comment instead.  This code is already an endless series of wrappers
around wrappers.

Also, please run your patch through scripts/checkpatch.pl.

Btw, I just want to emphasize again that I was 100% serious when I asked
you to delete the comment.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
