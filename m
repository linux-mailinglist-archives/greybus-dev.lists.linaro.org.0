Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 82288934745
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jul 2024 06:47:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 79C2040B40
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jul 2024 04:47:56 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	by lists.linaro.org (Postfix) with ESMTPS id 48A9E40B40
	for <greybus-dev@lists.linaro.org>; Thu, 18 Jul 2024 04:47:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=jfsgMZa0;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.167.181 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d92d1a5222so206003b6e.1
        for <greybus-dev@lists.linaro.org>; Wed, 17 Jul 2024 21:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721278072; x=1721882872; darn=lists.linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YEjjR4pJru8BJeimkJst45rGQ1t7SyphlvqL5W4Aano=;
        b=jfsgMZa0DJGvTtiz5EGpraknSqBpn+cq54+seQ01wNcPLr1Oio0HE44z9epdwCXG31
         L5ievrsFiolaCNYIHVb7WtWfIQx2QHRyAi52LmOFMdUaVOyB+fyX5dghT7omLZR0Mppz
         MP/12iTPcgvlf+vvOIaA8uuXSFqtSUfPJHc4XYGhIW+XN8FdPolwN3SuxJ+9e/8u7sTM
         2BZRyGixMnxXyvLkeFnc1TdgBkPqz68dQ1DkDknnlvdgvJ85+Iz2nUYBi803O94BJUM3
         rfQuS2gCnSpaV9oUqv8xK+kQ5HLgRQ7p4L9AcDxDHBbiShUJDb5ul2iVfh3WP8jpSDfs
         L2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721278072; x=1721882872;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEjjR4pJru8BJeimkJst45rGQ1t7SyphlvqL5W4Aano=;
        b=M9zmanUzIXCkwzS7tKCShPwHGwXEGLWMKgNhf2FqTBFxou7a4Pkce0FypVHwnjNPJ0
         gU1Mh36QSpup12tGh8HSWJNzXJXZtoxgGUC9cj65Ta+Mmu2JVtlw7oQiS/Vq0zWfdo5t
         WAcgpZiiMLiwj/g6+pXaRt+sogFflM+ri0su9e9wfBFqfEsjchiRvO0tTejg3biIwUD5
         +RwXvUm3GjQgqvkUEkejEApxYgNOF4fSGcNX4bd1DWcIh7ko5AtR9zsb/M699kbgbRvb
         KfBf+Q+adJ6Dh1NHB9hBGDxMaCRvwjXwl3xXM7sEbjIO6UoJ+Vediu12P/4rADkfCZj9
         ryjA==
X-Forwarded-Encrypted: i=1; AJvYcCUTMfwyCY9p5qvgO+/TXNWZ3Du4Fs8mYrYgQX8BS65sk3Qq7hyo/nkj+amJClhBDwUcMqPR7FDzhd87av+PrNpUX5L2CcRCTSPonCgq
X-Gm-Message-State: AOJu0YznuoF5+Rd5624BsR0fyiQ1yU52LwJr/on01NEEzmMHkGUZiQbX
	dYaKE4s/Koqf1pC6loE30EpKYIMYvHZo78UWca8TveQdfrlbXNiuce+hDAfSUW43+g==
X-Google-Smtp-Source: AGHT+IF7DJeOUaSHILHt8zGDWOZuZb99LEvSBbYC8BNRtyvtvlh/dKMmsUkVWsrC2KXScVmAfxsfIw==
X-Received: by 2002:a05:6870:214c:b0:260:f50e:923e with SMTP id 586e51a60fabf-260f50e92e2mr530155fac.37.1721278072649;
        Wed, 17 Jul 2024 21:47:52 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:f90b:a43c:39d1:be63])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260efc5a665sm206314fac.4.2024.07.17.21.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 21:47:52 -0700 (PDT)
Date: Wed, 17 Jul 2024 23:47:50 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juan =?iso-8859-1?Q?Jos=E9?= Arboleda <soyjuanarbol@gmail.com>
Message-ID: <c9b9919e-f470-4120-8039-08dc791c58c3@suswa.mountain>
References: <2024071723-nurture-magical-7817@gregkh>
 <20240718033207.333591-1-soyjuanarbol@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240718033207.333591-1-soyjuanarbol@gmail.com>
X-Rspamd-Queue-Id: 48A9E40B40
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.181:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	URIBL_BLOCKED(0.00)[checkpatch.pl:url,linaro.org:dkim,mail-oi1-f181.google.com:helo,mail-oi1-f181.google.com:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: S6CLQNUA6HTBTMRUG5FEHFVXYB3BWONU
X-Message-ID-Hash: S6CLQNUA6HTBTMRUG5FEHFVXYB3BWONU
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, johan@kernel.org, linux-staging@lists.linux.dev, trivial@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: break multi statement macro into multiple lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S6CLQNUA6HTBTMRUG5FEHFVXYB3BWONU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 10:32:07PM -0500, Juan Jos=E9 Arboleda wrote:
> The macro `gb_loopback_stats_attrs` in the Greybus loopback driver
> contains multiple statements, which should be enclosed in a do-while
> loop to ensure proper execution and adhere to coding standards.
>=20
> The latter is not possible as the macro expansion will create invalid C
> syntax. Theres is not such thing like inner function definition inside a
> global scope do-while in C.
>=20
> This patch nukes the `gb_loopback_stats_attrs` macro to enclose,
> addressing the style error flagged by checkpatch.pl.
>=20
> Signed-off-by: Juan Jos=E9 Arboleda <soyjuanarbol@gmail.com>
> ---

Sorry, it's not really important to follow checkpatch.  Checkpatch is
just a Perl script and sometimes it gets things wrong.  It's a tool not
a king.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
