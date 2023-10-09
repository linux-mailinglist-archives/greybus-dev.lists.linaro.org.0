Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 578567BEED3
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Oct 2023 01:09:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E11E3F60B
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Oct 2023 23:09:05 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 96DE93EAB2
	for <greybus-dev@lists.linaro.org>; Mon,  9 Oct 2023 23:08:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=chromium.org header.s=google header.b=SDbRrtcQ;
	spf=pass (lists.linaro.org: domain of keescook@chromium.org designates 209.85.214.180 as permitted sender) smtp.mailfrom=keescook@chromium.org;
	dmarc=pass (policy=none) header.from=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c871a095ceso36555245ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 09 Oct 2023 16:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696892937; x=1697497737; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xZEAbTE1jnX14hR8pCQlTibWlz5S6mt8A6dPfKwpsV8=;
        b=SDbRrtcQfhHkfDvNwyeyVCYw0yza/U5NBbApPoVPvIRB0dNuojM15Ot18abQUNilLV
         2aiYgg+R5vQxmPGHjZy5Dgpeew+nq7cMbHQG6aNtd3P6uIuAoYSZK/BcO0XMSUkieXhW
         spY0aW/kWuwWLrq5jTV9YCIVChdigv+XKwhvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696892937; x=1697497737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZEAbTE1jnX14hR8pCQlTibWlz5S6mt8A6dPfKwpsV8=;
        b=MRjbBKxCjGoFlF+hVq0gc+flEBYPdirBAVVn4Kdtivjqr1gCcYGtRr7eDcd2/xknsN
         DKMASYxU4NGLipu7gFSbzoIjuYOKqFervBMlmhwRXkVuiAcccfIbuXzMikZrpgOtEk30
         gp/0Sf0w3pphf9ScaSOVjcZnVbuCjMNmPaxmiAc6IIsGdAwvECwaRKPuFjxg8f9eUkDp
         8udREcNVE97h84GJGqKooNgkZR/mhSPf6JEHfJA5hFrcLjYljkryDHq11SjmqNbrMFlv
         qXnIJvU+sDMfvZHlp3+hb4n8UJOccyECZKgg02VYvoTsqY/U2QbtXk9ENcvA+9+Mqcv4
         RhFg==
X-Gm-Message-State: AOJu0YwmR+ABOYEEX04DiTjJIqSbH4h/aMypKckZ4G4mWKpStVtPpBuu
	+Tppy8BugQU8Med+3tIrzx5qhA==
X-Google-Smtp-Source: AGHT+IE4bNEi4bN0RSOpbI1oO6kddrnbOzEwTunUzAyAEf4FA+FbGaK82D5lHzRVV9vr+ORb3iYMug==
X-Received: by 2002:a17:902:ec84:b0:1c5:d063:b72a with SMTP id x4-20020a170902ec8400b001c5d063b72amr16810663plg.27.1696892936571;
        Mon, 09 Oct 2023 16:08:56 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id bh2-20020a170902a98200b001c43307f87asm10162365plb.91.2023.10.09.16.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 16:08:56 -0700 (PDT)
Date: Mon, 9 Oct 2023 16:08:52 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <202310091608.C892CFA@keescook>
References: <ZSR2O6zGyT/VX6ve@work>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZSR2O6zGyT/VX6ve@work>
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[chromium.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 96DE93EAB2
Message-ID-Hash: WPNNH5YNPYBYC25OIM4YUTDMUHX5GE7F
X-Message-ID-Hash: WPNNH5YNPYBYC25OIM4YUTDMUHX5GE7F
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH][next] staging: greybus: Add __counted_by for struct apr_rx_buf and use struct_size()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WPNNH5YNPYBYC25OIM4YUTDMUHX5GE7F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 09, 2023 at 03:52:59PM -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() helper, instead of the open-coded
> version, to calculate the size for the allocation of the whole
> flexible structure, including of course, the flexible-array member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Looks right, "len" is updated before accessing "data[]".

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
