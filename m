Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC8C3823DC
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 07:56:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F95B60D3D
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 05:56:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5D2586114A; Mon, 17 May 2021 05:56:45 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 57B7460B99;
	Mon, 17 May 2021 05:56:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F097461A34
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 05:58:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E6A7161A48; Sat, 15 May 2021 05:58:43 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by lists.linaro.org (Postfix) with ESMTPS id DF24461A34
 for <greybus-dev@lists.linaro.org>; Sat, 15 May 2021 05:58:41 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id h16so1290163pfk.0
 for <greybus-dev@lists.linaro.org>; Fri, 14 May 2021 22:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=quQuju5BxZq7ggpYY/T9Kt5b+6CSVPIxgVITVpTO9KE=;
 b=dmczgfn23HkMnD/1xckytRmAxOEBCMjhQol0JKvon7mdsbADKsibwKa5LdREdNxIMz
 UfXbyix4s5gKro/VyECzHGwpKfyG61q4jlmwunoSaRm7BoieCKo4hXGntOI1/KAKntKb
 iK5FV4YscaerZZG7FOqsNs9A74r0/OMwG3QLOWC8OE2k3H5gD2p+ObQi353s+I3bm0UR
 5A6QxPH53jcTi6+c92wsOdEahmKFEfKxt1qHRBXZkG5lv9/JRfFdv42bk0/vJB5pZx5s
 5xOgDJtZ0iiyO9nNnKowPc6xjSUTPxw/OBqMUz1jKmh9BHJwZ5xGX/yTS8vqJkXyDqed
 6vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=quQuju5BxZq7ggpYY/T9Kt5b+6CSVPIxgVITVpTO9KE=;
 b=YhAWcM5CYtS9ALm/pQ+f++9scke328N3UTPwRvVnkV0q+7HYQ/FCAUhw+hGdCL2Mw2
 XFUMJz75fnLvVg4sY4xNJnllMOvakrWuc3enX52P6wvYqzN5D7FWGotPSW3ELQ9qT4jM
 T3MsllcZ9qa1CVv2014aDPLXIu51fFySGLQJ0cZEs3eqZFN5daq0z70/O4H9JNt5q/Il
 zUeAjzhgO+GfQVX4ynAJuW9ypHZAC4N12jCq9sGOPhr7qmxzf66MxxMK7QBt7HPPebBW
 bX5AxU2Bf5VQUyvCaZgvLk+6TodclNaM7NOhyDGZa0ZOwEpLf7iWaOrjQU47UoGXUYUy
 ESNw==
X-Gm-Message-State: AOAM531gbM04gOORigQZiMlBd2G31slYJJ6Xk5Sk1lPWNQ5XhI3eJqq9
 jzGPqU5s7Ev7GE9kQv1k4EY=
X-Google-Smtp-Source: ABdhPJx8Caznyp43VzJam8uwjnUsmT5GcJV648F6RKyUhtq6e6ZR5fRzb9XJhVzQTYjyBE2FcxJ0Vw==
X-Received: by 2002:aa7:8692:0:b029:28e:7bfd:655c with SMTP id
 d18-20020aa786920000b029028e7bfd655cmr49841220pfo.81.1621058321063; 
 Fri, 14 May 2021 22:58:41 -0700 (PDT)
Received: from fedora ([2405:201:6008:61b4:4e16:5348:d963:c66d])
 by smtp.gmail.com with ESMTPSA id a10sm1082534pjs.39.2021.05.14.22.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 22:58:40 -0700 (PDT)
Date: Sat, 15 May 2021 11:28:17 +0530
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <YJ9i+T5IfaDwdaBX@fedora>
References: <20210515034116.660895-1-chouhan.shreyansh630@gmail.com>
 <YJ9dDwKMKkifeICJ@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJ9dDwKMKkifeICJ@kroah.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 17 May 2021 05:56:39 +0000
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add declare_ to
 declaring macros
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: elder@kernel.org, linux-staging@lists.linux.dev, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Sat, May 15, 2021 at 07:33:03AM +0200, Greg KH wrote:
> On Sat, May 15, 2021 at 09:11:16AM +0530, Shreyansh Chouhan wrote:
> > Prefixed the names of all the macros that were used for declaring things
> > with 'declare_'. This should help with clarifying about what these
> > macros do.
> 
> Thanks, but I think I will leave the code as-is.  It's a good "test" for
> people who try to modify the code without actually building it :)
> 

Oh. Okay, I will try fixing something that might actually be a coding
style issue this time then. :)

> greg k-h

Regards,
Shreyansh Chouhan.
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
