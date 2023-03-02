program color

implicit none
integer :: k, lframe,i,j,nat,slice
integer, allocatable :: idx_cls(:),icy(:),coloring(:)


nat=17479 !** change according to .gro file
lframe=1001 !** change according to no. frames in traj
slice=0 !** needs to match the slicing of the traj e.g.trajconv -skip 100

open(unit=100, file='../idx.dat', status='old')
! for a traj with 50001 frames, the idx.dat file contains folliwng:
! - first 50001 lines gives the number of icy OWs -> informs the size of the icy array
! - next 50001 lines give the indices of the icy OWs -> informs which elements
! in coloring array end up = 1

open(unit=101, file='A.color')
allocate(idx_cls(lframe)) !column length of 50001 
do i=1,lframe
        read(100,*) idx_cls(i) 
        ! reads first 50001 line into idx_cls, which corresponds to no. of icy OWs found per ts
enddo

do i=1,lframe ! i.e for the next 50001 lines in idx.dat
 allocate(icy(idx_cls(i))) ! icy size depends on the no of icy OWs found/ ts
 allocate(coloring(nat))   ! coloring array is the size of all atoms in gro file
 coloring(:)=0 
 read(100,*) icy(:)
 ! continue reading, if it read up to 50001 above, the next line to be read is 50002
 ! reads in the indices of the icy OWs into icy
  do j=1,idx_cls(i) ! the number of icy OWs /ts
    coloring(icy(j)+1)=1 ! add 1 to indices of OW (they were MW before),all elements in coloring are zero, populate the array with ones that correspond to the indices in icy
   enddo  
  do k=1,lframe !,slice ! skip every 100
    if (k.eq.i) then 
      !print*,k, idx_cls(k)
      write(101,*) coloring ! write coloring array every 100th ts
    endif
  enddo
deallocate(icy,coloring)       
enddo







end program color
