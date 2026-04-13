Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NjzPOquv3GlcVQkAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 10:56:11 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA383E967F
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 10:56:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA47B404C0
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 08:50:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	by lists.linaro.org (Postfix) with ESMTPS id 2E243402AE
	for <greybus-dev@lists.linaro.org>; Mon, 13 Apr 2026 07:04:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ccqoY3Bx;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.221.52 as permitted sender) smtp.mailfrom=error27@gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf7683a28so2597836f8f.2
        for <greybus-dev@lists.linaro.org>; Mon, 13 Apr 2026 00:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776063890; x=1776668690; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRBxi9VXhNJNAcKSM1KuAwC9XmMF3xEafmK85DMI9C0=;
        b=ccqoY3BxdTactqVlM+jRszMNH6aatz2b8SePKB5B0sEKrQqwCzTRtb1NcSD5a+q232
         x0Nps26/zXUig37gkWiEpaF/5cTUMNha48zHlZ+Gs7+ZcXIsBEkyj4cnmKlLtQjM5f+u
         SKEZyRncTq0pzD+v15uWon02xnbQuYyU6MCL27Y8EJoPzMpkhWZPNxxprvDyR6YVSune
         3ocMzkWuBbPJc2jdtcXnwRMzzNq5FTVWMPkFyee5AXHcOJxbqCcOT6B6CsPqAYgy1ujI
         gqKKmDiFRDd+1fB04bQnZJuJyhuTjsq9f+mGhwa1b2ro6DvckigCbyIlIcV0+3RjaQus
         hDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063890; x=1776668690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRBxi9VXhNJNAcKSM1KuAwC9XmMF3xEafmK85DMI9C0=;
        b=jRQMFf4HguaZAEfSVkhSjQFKIgQm92tACrcP4tlQq6y0GNwDAXDOpc1eXz13SS+l7L
         j4MZp4pdNg7MFUJPet7hNGPpDQPwr9KQitJM4mNdvfm/aVMEwiPPvt3RhL31aQEolDfh
         4X43KemDz6NnRdDpU7hJLqO3NYA8E2wEAJNHb39yHnmtbPfs/m++4wDL4fX36k2C8S1F
         TTpU4S4Olu/wSJy3ijW3xHV5dU7z1WnAw3sJX+1hHAK1IH90iVT7cxH5xBlZib1Z0lkm
         MCqxn+U0QfhDZ4eETMWzuLq/GsnOdvUyKfQXzi0IYn5aXjG8ouFzOOoxXf6ti3wL/vpn
         hTeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1xTzL2rzp2IG/DYokh4JZR60Fm3X5QPJfKW4CZjqMZeS3mX1CZvpGKdXoiizfxewgNmHURH1FArp4Og==@lists.linaro.org
X-Gm-Message-State: AOJu0YwTWJSlMNbDPJOJnP3kUO1Oj6xnWKksQPhY27JFzm0pt8y1nSIc
	b2pz0I1ToEmI2Xqk8eCGvu3tkhD0dl3B73+yc6wpjacKCQvvNXHIKegO
X-Gm-Gg: AeBDiesQgh0PKk5OYrjz8aEVISY2KZFxr9sI7VNvFXSREvEaKYH52Zr/J12wv5jXj3B
	U6wlx1eM3chj/LZAKrBSeIfjzhX9cJsr363+S1ajAE3CX2UD+q6t8Yofe7cMQ2jQQl5yyOl4mWE
	AlPzclxVFeVkYefTkmeLvqKlbqYJcMtoCOzKq42P9PIrVgXJ0/Ei/kMXHY+PMEySjY/02bpZZ5o
	q2OzMACO6lbonunrZsAe8Vr3ZfcVfoT6acmv44e/7wxO9Eap2jzOIe8igUf0qNEqbOjqh7J6bF3
	ojsWbneiiE0LbAIJPKeDZ20ErcUsoHyI5zlDL0u4sEqXJRfWoFyP3ab/nQo/MchZ2/rPi7eW703
	8qKVSrUhmumZ3/q5rpV8CQyt++27Q68OuXl9mWNPhKN3f7+WSH0rzZS0T0CDP5JblJwLP79eyft
	XENCEydF6VQEJBm+Pgtsg=
X-Received: by 2002:a05:6000:400a:b0:43c:f4df:9245 with SMTP id ffacd0b85a97d-43d642cbb8bmr18191781f8f.47.1776063889770;
        Mon, 13 Apr 2026 00:04:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7794cce5sm7509912f8f.9.2026.04.13.00.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:04:49 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:04:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Message-ID: <adyVjoDaJoWqd-OV@stanley.mountain>
References: <20260411182055.24413-1-dennylin0707@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260411182055.24413-1-dennylin0707@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JCI3NTPO7GJA3AZXUMJCPY3YSHKWPTPV
X-Message-ID-Hash: JCI3NTPO7GJA3AZXUMJCPY3YSHKWPTPV
X-Mailman-Approved-At: Mon, 13 Apr 2026 08:50:49 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: audio: extract topology size retrieval into a helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JCI3NTPO7GJA3AZXUMJCPY3YSHKWPTPV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.651];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 7BA383E967F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 06:20:55PM +0000, Hungyu Lin wrote:
> The topology retrieval code currently mixes the size query with
> allocation and data fetch in a single function.
> 
> Extract the size query into a helper to make the control flow clearer.
> 
> No functional change.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/greybus/audio_gb.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)

I don't see how this is a cleanup at all...

If you were the maintainer of the code, then you could do whatever
you want, but this is your first kernel patch.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
